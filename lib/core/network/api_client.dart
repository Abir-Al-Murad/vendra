import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../failures/failure.dart';
import '../services/auth_storage.dart';
import 'api_response.dart';

enum ApiVersion { v1, v2 }

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref: ref);
});

class ApiClient {
  final Dio _dio;
  final Logger _logger = Logger();
  final Ref ref;

  static const String _baseUrl = 'https://ecom-api-1.onrender.com/api';

  ApiClient({required this.ref, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: _baseUrl,
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
              sendTimeout: const Duration(seconds: 30),
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
          ) {
    _addInterceptors();
  }

  // ---------------------------------------------------------------------------
  // API VERSION
  // ---------------------------------------------------------------------------

  String _versionedPath(String path, ApiVersion version) {
    final normalizedPath = path.startsWith('/') ? path : '/$path';
    final versionPrefix = '/${version.name}';

    if (normalizedPath == versionPrefix ||
        normalizedPath.startsWith('$versionPrefix/')) {
      return normalizedPath;
    }

    return '$versionPrefix$normalizedPath';
  }

  // ---------------------------------------------------------------------------
  // INTERCEPTORS
  // ---------------------------------------------------------------------------

  void _addInterceptors() {
    _dio.interceptors.clear();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await AuthStorage.instance.getAccessToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    _logRequest(options);
    handler.next(options);
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response);
    handler.next(response);
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    _logError(error);

    if (error.response?.statusCode == 401 &&
        !error.requestOptions.path.contains('/auth/refresh')) {
      final newToken = await _refreshToken();

      if (newToken != null) {
        final requestOptions = error.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newToken';

        try {
          final retryResponse = await _dio.fetch(requestOptions);
          handler.resolve(retryResponse);
          return;
        } on DioException catch (e) {
          handler.next(e);
          return;
        }
      }
    }

    handler.next(error);
  }

  // ---------------------------------------------------------------------------
  // TOKEN REFRESH
  // ---------------------------------------------------------------------------

  bool _isRefreshing = false;
  Completer<String?>? _refreshCompleter;

  Future<String?> _refreshToken() async {
    if (_isRefreshing) {
      return _refreshCompleter?.future;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<String?>();

    try {
      final refreshToken = await AuthStorage.instance.getRefreshToken();

      if (refreshToken == null) {
        _refreshCompleter!.complete(null);
        return null;
      }

      final response = await _dio.post(
        '/v1/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );

      if (response.statusCode == 200) {
        final newToken = response.data is Map
            ? response.data['access_token'] as String?
            : null;

        if (newToken != null) {
          await AuthStorage.instance.saveAccessToken(newToken);
          _refreshCompleter!.complete(newToken);
          return newToken;
        }
      }

      _refreshCompleter!.complete(null);
      return null;
    } catch (_) {
      if (!(_refreshCompleter?.isCompleted ?? true)) {
        _refreshCompleter!.complete(null);
      }
      return null;
    } finally {
      _isRefreshing = false;
      _refreshCompleter = null;
    }
  }

  // ---------------------------------------------------------------------------
  // LOGGING
  // ---------------------------------------------------------------------------

  void _logRequest(RequestOptions options) {
    _logger.i(
      '┌───────────────────────────────────────────\n'
      '│ REQUEST: ${options.method} ${options.uri}\n'
      '│ Headers: ${options.headers}\n'
      '│ Data: ${options.data}\n'
      '└───────────────────────────────────────────',
    );
  }

  void _logResponse(Response response) {
    _logger.i(
      '┌───────────────────────────────────────────\n'
      '│ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}\n'
      '│ Data: ${response.data}\n'
      '└───────────────────────────────────────────',
    );
  }

  void _logError(DioException error) {
    _logger.e(
      '┌───────────────────────────────────────────\n'
      '│ REQUEST : ${error.requestOptions.method} ${error.requestOptions.uri}\n'
      '│ PATH    : ${error.requestOptions.path}\n'
      '│ QUERY   : ${error.requestOptions.queryParameters}\n'
      '│ BODY    : ${error.requestOptions.data}\n'
      '│ STATUS  : ${error.response?.statusCode}\n'
      '│ RESPONSE: ${error.response?.data}\n'
      '└───────────────────────────────────────────',
    );
  }

  // ---------------------------------------------------------------------------
  // GET
  // ---------------------------------------------------------------------------

  Future<ApiResponse> get(
    String path, {
    ApiVersion version = ApiVersion.v1,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        _versionedPath(path, version),
        queryParameters: queryParameters,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // POST
  // ---------------------------------------------------------------------------

  Future<ApiResponse> post(
    String path, {
    ApiVersion version = ApiVersion.v1,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        _versionedPath(path, version),
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // PUT
  // ---------------------------------------------------------------------------

  Future<ApiResponse> put(
    String path, {
    ApiVersion version = ApiVersion.v1,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        _versionedPath(path, version),
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // PUT MULTIPART
  // ---------------------------------------------------------------------------

  Future<ApiResponse> putMultipart(
    String path, {
    ApiVersion version = ApiVersion.v1,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _dio.put(
        _versionedPath(path, version),
        data: formData,
        queryParameters: queryParameters,
        options: options ?? Options(contentType: 'multipart/form-data'),
        onSendProgress: onSendProgress,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // PATCH
  // ---------------------------------------------------------------------------

  Future<ApiResponse> patch(
    String path, {
    ApiVersion version = ApiVersion.v1,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.patch(
        _versionedPath(path, version),
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<ApiResponse> delete(
    String path, {
    ApiVersion version = ApiVersion.v1,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        _versionedPath(path, version),
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // POST MULTIPART
  // ---------------------------------------------------------------------------

  Future<ApiResponse> postMultipart(
    String path, {
    ApiVersion version = ApiVersion.v1,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _dio.post(
        _versionedPath(path, version),
        data: formData,
        queryParameters: queryParameters,
        options: options ?? Options(contentType: 'multipart/form-data'),
        onSendProgress: onSendProgress,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // RESPONSE HANDLING
  // ---------------------------------------------------------------------------

  ApiResponse _handleResponse(Response<dynamic> response) {
    final isSuccess =
        response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300;

    final data = response.data;

    final message = data is Map
        ? (data['message']?.toString() ?? response.statusMessage)
        : response.statusMessage;

    return ApiResponse(
      body: data,
      isSuccess: isSuccess,
      statusCode: response.statusCode ?? 0,
      errorMessage: isSuccess ? null : message,
    );
  }

  // ---------------------------------------------------------------------------
  // ERROR HANDLING
  // ---------------------------------------------------------------------------

  ApiResponse _handleError(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    final data = error.response?.data;

    Failure? failure;
    String message;

    switch (error.type) {
      case DioExceptionType.connectionError:
        failure = const NetworkFailure('No internet connection');
        message = 'No internet connection';
        break;

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        failure = const TimeoutFailure('Connection timeout');
        message = 'Connection timeout';
        break;

      case DioExceptionType.badResponse:
        final serverMsg = data is Map
            ? (data['message'] ?? data['error'] ?? data['detail'])
            : null;

        message = serverMsg?.toString() ?? 'Server error';
        failure = ServerFailure(message);
        break;

      default:
        message = error.message ?? 'Something went wrong';
        failure = UnknownFailure(message);
        break;
    }

    return ApiResponse(
      body: data,
      isSuccess: false,
      statusCode: statusCode,
      errorMessage: message,
      failure: failure,
    );
  }
}
