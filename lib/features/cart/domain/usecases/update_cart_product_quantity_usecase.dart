import '../repositories/cart_repository.dart';

class UpdateCartProductQuantityUseCase {
  final CartRepository _cartRepository;

  const UpdateCartProductQuantityUseCase(this._cartRepository);

  Future<String> call({required String productId, required int quantity}) {
    return _cartRepository.updateCartProductQuantity(
      productId: productId,
      quantity: quantity,
    );
  }
}
