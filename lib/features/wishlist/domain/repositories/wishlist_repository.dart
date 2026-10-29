import 'package:ecom/features/products/domain/entities/product_list_entity.dart';

abstract class WishlistRepository {
  Future<String> addToWishlist({required String productId});

  Future<String> removeFromWishlist({required String productId});

  Future<ProductListEntity> getWishlist();
}
