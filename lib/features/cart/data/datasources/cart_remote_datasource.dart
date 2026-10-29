import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/cart/data/models/cart_model.dart';
import 'package:ecom/features/products/domain/entities/product_list_entity.dart';

import '../../../../common/models/meta_data_model.dart';
import '../../../products/data/models/product_model.dart';

class CartRemoteDatasource {
  final ApiClient _apiClient;
  const CartRemoteDatasource(this._apiClient);

  Future<String> addToCart({required String productId}) async {
    final response = await _apiClient.post(
      '/cart',
      data: {'productId': productId},
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to add to cart');
    }
  }

  Future<String> updateCartProductQuantity({required String productId, required int quantity}) async {
    final response = await _apiClient.put(
      '/cart/$productId',
      data: {'count': quantity},
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to update cart');
    }
  }

  Future<CartModel> getCartProducts() async {
    final response = await _apiClient.get('/cart');

    if (response.isSuccess) {
      return CartModel.fromJson(
        response.body as Map<String, dynamic>,
      );
    } else {
      throw response.failure ??
          Exception('Failed to fetch cart products');
    }
  }

  Future<String> removeProductFromCart({required String productId}) async {
    final response = await _apiClient.delete('/cart/$productId');

    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to remove product from cart');
    }
  }

  Future<String> clearCart() async {
    final response = await _apiClient.delete('/cart');

    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to clear cart');
    }
  }

}