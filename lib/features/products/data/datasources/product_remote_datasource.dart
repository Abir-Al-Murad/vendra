import 'package:ecom/common/models/meta_data_model.dart';
import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/products/data/models/product_model.dart';
import 'package:ecom/features/products/domain/entities/product_list_entity.dart';

class ProductRemoteDatasource {
  final ApiClient _apiClient;

  const ProductRemoteDatasource(this._apiClient);

  Future<ProductListEntity> getAllProducts({
    int? limit,
    String? sort,
    String? fields,
    num? priceGte,
    num? priceLte,
    int? page,
    String? keyword,
    String? brand,
    List<String>? categoryIn,
  }) async {
    final Map<String, dynamic> queryParameters = {
      if (limit != null) 'limit': limit,
      if (sort != null) 'sort': sort,
      if (fields != null) 'fields': fields,
      if (priceGte != null) 'price[gte]': priceGte,
      if (priceLte != null) 'price[lte]': priceLte,
      if (page != null) 'page': page,
      if (keyword != null) 'keyword': keyword,
      if (brand != null) 'brand': brand,
      if (categoryIn != null)
        for (final categoryId in categoryIn)
          'category[in][]': categoryId,
    };

    final response = await _apiClient.get(
      '/products',
      queryParameters: queryParameters,
    );

    if (response.isSuccess) {
      final metadata = response.body['metadata'];

      final products = (response.body['data'] as List)
          .map(
            (product) => ProductModel.fromJson(
          product as Map<String, dynamic>,
        ).toEntity(),
      )
          .toList();

      return ProductListEntity(
        products: products,
        metaData: MetaDataModel.fromJson(metadata).toEntity(),
      );
    } else {
      throw response.failure ?? Exception('Failed to fetch products');
    }
  }

  Future<ProductModel> getSpecificProduct({
    required String productId,
  }) async {
    final response = await _apiClient.get('/products/$productId');
    if (response.isSuccess) {
      return ProductModel.fromJson(
        response.body as Map<String, dynamic>,
      );
    } else {
      throw response.failure ?? Exception('Failed to fetch product');
    }
  }
}