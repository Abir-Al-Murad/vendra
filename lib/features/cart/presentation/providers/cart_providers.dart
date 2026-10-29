import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:ecom/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:ecom/features/cart/domain/repositories/cart_repository.dart';
import 'package:ecom/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecom/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:ecom/features/cart/domain/usecases/get_cart_products_usecase.dart';
import 'package:ecom/features/cart/domain/usecases/remove_product_from_cart_usecase.dart';
import 'package:ecom/features/cart/domain/usecases/update_cart_product_quantity_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartRemoteDataSourceProvider = Provider<CartRemoteDatasource>((ref) {
  return CartRemoteDatasource(ref.read(apiClientProvider));
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl(ref.read(cartRemoteDataSourceProvider));
});

final addToCartUseCaseProvider = Provider<AddToCartUseCase>((ref) {
  return AddToCartUseCase(ref.read(cartRepositoryProvider));
});

final updateCartProductQuantityUseCaseProvider =
    Provider<UpdateCartProductQuantityUseCase>((ref) {
      return UpdateCartProductQuantityUseCase(ref.read(cartRepositoryProvider));
    });

final getCartProductsUseCaseProvider = Provider<GetCartProductsUseCase>((ref) {
  return GetCartProductsUseCase(ref.read(cartRepositoryProvider));
});

final removeProductFromCartUseCaseProvider =
    Provider<RemoveProductFromCartUseCase>((ref) {
      return RemoveProductFromCartUseCase(ref.read(cartRepositoryProvider));
    });

final clearCartUseCaseProvider = Provider<ClearCartUseCase>((ref) {
  return ClearCartUseCase(ref.read(cartRepositoryProvider));
});
