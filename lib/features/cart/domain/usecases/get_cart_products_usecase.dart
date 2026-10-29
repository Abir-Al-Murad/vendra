import 'package:ecom/features/cart/domain/entities/cart_entity.dart';

import '../repositories/cart_repository.dart';

class GetCartProductsUseCase {
  final CartRepository _cartRepository;

  const GetCartProductsUseCase(this._cartRepository);

  Future<CartEntity> call() {
    return _cartRepository.getCartProducts();
  }
}
