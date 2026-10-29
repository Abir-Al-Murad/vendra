import '../repositories/cart_repository.dart';

class RemoveProductFromCartUseCase {
  final CartRepository _cartRepository;

  const RemoveProductFromCartUseCase(this._cartRepository);

  Future<String> call({required String productId}) {
    return _cartRepository.removeProductFromCart(productId: productId);
  }
}
