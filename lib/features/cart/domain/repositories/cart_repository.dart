import 'package:ecom/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<String> addToCart({required String productId});

  Future<String> updateCartProductQuantity({
    required String productId,
    required int quantity,
  });

  Future<CartEntity> getCartProducts();

  Future<String> removeProductFromCart({required String productId});

  Future<String> clearCart();
}
