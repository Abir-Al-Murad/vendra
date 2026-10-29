import '../repositories/wishlist_repository.dart';

class RemoveFromWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  const RemoveFromWishlistUseCase(this._wishlistRepository);

  Future<String> call({required String productId}) {
    return _wishlistRepository.removeFromWishlist(productId: productId);
  }
}
