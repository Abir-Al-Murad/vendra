import '../repositories/wishlist_repository.dart';

class AddToWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  const AddToWishlistUseCase(this._wishlistRepository);

  Future<String> call({required String productId}) {
    return _wishlistRepository.addToWishlist(productId: productId);
  }
}
