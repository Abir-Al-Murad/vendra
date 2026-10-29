import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:ecom/features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:ecom/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:ecom/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:ecom/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:ecom/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistRemoteDataSourceProvider = Provider<WishlistRemoteDatasource>((
  ref,
) {
  return WishlistRemoteDatasource(ref.read(apiClientProvider));
});

final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) {
  return WishlistRepositoryImpl(ref.read(wishlistRemoteDataSourceProvider));
});

final addToWishlistUseCaseProvider = Provider<AddToWishlistUseCase>((ref) {
  return AddToWishlistUseCase(ref.read(wishlistRepositoryProvider));
});

final removeFromWishlistUseCaseProvider = Provider<RemoveFromWishlistUseCase>((
  ref,
) {
  return RemoveFromWishlistUseCase(ref.read(wishlistRepositoryProvider));
});

final getWishlistUseCaseProvider = Provider<GetWishlistUseCase>((ref) {
  return GetWishlistUseCase(ref.read(wishlistRepositoryProvider));
});
