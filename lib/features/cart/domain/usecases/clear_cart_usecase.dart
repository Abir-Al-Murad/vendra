import '../repositories/cart_repository.dart';

class ClearCartUseCase {
  final CartRepository _cartRepository;

  const ClearCartUseCase(this._cartRepository);

  Future<String> call() {
    return _cartRepository.clearCart();
  }
}
