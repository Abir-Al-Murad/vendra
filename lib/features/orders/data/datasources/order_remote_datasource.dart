import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/orders/data/models/order_model.dart';

class OrderRemoteDataSource {
  final ApiClient _apiClient;
  const OrderRemoteDataSource(this._apiClient);

  Future<String> createCashOrderFromCart({
    required String details,
    required String phone,
    required String city,
    required String postalCode,
    required String cartId,
  }) async {
    final response = await _apiClient.post(
      "/orders/$cartId",
      version: ApiVersion.v2,
      data: {
        "shippingAddress": {
          'details': details,
          'phone': phone,
          'city': city,
          'postalCode': postalCode,
        },
      },
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ??
          Exception('Failed to create cash order from cart');
    }
  }

  Future<OrderModel> getUserOrdes({required String userId}) async {
    final response = await _apiClient.get(
      "/orders/user/$userId",
      version: ApiVersion.v2,
    );
    if (response.isSuccess) {
      return OrderModel.fromJson(response.body['data'] as Map<String, dynamic>);
    } else {
      throw response.failure ?? Exception('Failed to get user orders');
    }
  }

  // Future<>

}