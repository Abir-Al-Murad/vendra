import 'package:ecom/features/products/domain/entities/product_list_entity.dart';

import '../repositories/wishlist_repository.dart';

class GetWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  const GetWishlistUseCase(this._wishlistRepository);

  Future<ProductListEntity> call() {
    return _wishlistRepository.getWishlist();
  }
}
