import '../repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _cartRepository;

  const AddToCartUseCase(this._cartRepository);

  Future<String> call({required String productId}) {
    return _cartRepository.addToCart(productId: productId);
  }
}
