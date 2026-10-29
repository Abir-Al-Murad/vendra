import 'package:ecom/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:ecom/features/cart/domain/entities/cart_entity.dart';
import 'package:ecom/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource _cartRemoteDatasource;

  const CartRepositoryImpl(this._cartRemoteDatasource);

  @override
  Future<String> addToCart({required String productId}) {
    return _cartRemoteDatasource.addToCart(productId: productId);
  }

  @override
  Future<String> updateCartProductQuantity({
    required String productId,
    required int quantity,
  }) {
    return _cartRemoteDatasource.updateCartProductQuantity(
      productId: productId,
      quantity: quantity,
    );
  }

  @override
  Future<CartEntity> getCartProducts() async {
    final cartModel = await _cartRemoteDatasource.getCartProducts();
    return cartModel.toEntity();
  }

  @override
  Future<String> removeProductFromCart({required String productId}) {
    return _cartRemoteDatasource.removeProductFromCart(productId: productId);
  }

  @override
  Future<String> clearCart() {
    return _cartRemoteDatasource.clearCart();
  }
}
