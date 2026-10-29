import 'package:ecom/common/models/meta_data_model.dart';
import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/products/domain/entities/product_list_entity.dart';

import '../../../products/data/models/product_model.dart';

class WishlistRemoteDatasource {
  final ApiClient _apiClient;
  const WishlistRemoteDatasource(this._apiClient);

  Future<String> addToWishlist({required String productId}) async {
    final response = await _apiClient.post(
      '/wishlist',
      data: {'productId': productId},
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to add to wishlist');
    }
  }

  Future<String> removeFromWishlist({required String productId}) async {
    final response = await _apiClient.delete(
      '/wishlist/$productId',
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to remove from wishlist');
    }
  }

  Future<ProductListEntity> getWishlist() async {
    final response = await _apiClient.get('/wishlist');
    if (response.isSuccess) {
      final products = (response.body['data'] as List)
          .map(
            (product) => ProductModel.fromJson(
          product as Map<String, dynamic>,
        ).toEntity(),
      )
          .toList();

      return ProductListEntity(products: products,metaData: MetaDataModel.fromJson(response.body['metadata']).toEntity());
    } else {
      throw response.failure ?? Exception('Failed to fetch wishlist');
    }
  }
}