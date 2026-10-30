import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/auth/data/models/auth_model.dart';

class AuthRemoteDatasource {
  final ApiClient _apiClient;
  const AuthRemoteDatasource(this._apiClient);

  Future<AuthModel> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post(
      '/auth/signin',
      data: {'email': email, 'password': password},
    );
    if (response.isSuccess) {
      return AuthModel.fromJson(response.body);
    } else {
      throw response.failure ?? Exception('Failed to sign in');
    }
  }

  Future<AuthModel> signUp({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phoneNumber,
  }) async {
    final response = await _apiClient.post(
      '/auth/signup',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phoneNumber,
      },
    );
    if (response.isSuccess) {
      return AuthModel.fromJson(response.body);
    } else {
      throw response.failure ?? Exception('Failed to sign up');
    }
  }

  Future<String> forgotPassword({required String email}) async {
    final response = await _apiClient.post(
      '/auth/forgotpasswords',
      data: {'email': email},
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ??
          Exception('Failed to send forgot password request');
    }
  }

  Future<String> verifyResetCode({required String code}) async {
    final response = await _apiClient.post("/auth/verifyResetCode");
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception("Failed to verify code");
    }
  }

  Future<String> updatePassword({
    required String currentPassword,
    required String password,
    required String rePassword,
  }) async {
    final response = await _apiClient.post(
      "/users/changeMyPassword",
      data: {
        "currentPassword": currentPassword,
        "password": password,
        "rePassword": rePassword,
      },
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception("Failed to update password");
    }
  }

  Future<String> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    final response = await _apiClient.post(
      "/auth/resetpasswords",
      data: {
        "email": email,
        "newPassword": newPassword,
      },
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception("Failed to reset password");
    }
  }

  Future<String> verifyToken({required String token}) async {
    final response = await _apiClient.get(
      "/auth/verifyToken",
    );
    if (response.isSuccess) {
      return response.body['decoded']['id'] as String;
    } else {
      throw response.failure ?? Exception("Failed to verify token");
    }
  }

  Future<void> updateLoggedUserData({required String name, required String email,required String phone}) async {

  }
}
