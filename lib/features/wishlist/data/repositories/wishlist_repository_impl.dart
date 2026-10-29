import 'package:ecom/features/products/domain/entities/product_list_entity.dart';
import 'package:ecom/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:ecom/features/wishlist/domain/repositories/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDatasource _wishlistRemoteDatasource;

  const WishlistRepositoryImpl(this._wishlistRemoteDatasource);

  @override
  Future<String> addToWishlist({required String productId}) {
    return _wishlistRemoteDatasource.addToWishlist(productId: productId);
  }

  @override
  Future<String> removeFromWishlist({required String productId}) {
    return _wishlistRemoteDatasource.removeFromWishlist(productId: productId);
  }

  @override
  Future<ProductListEntity> getWishlist() {
    return _wishlistRemoteDatasource.getWishlist();
  }
}
