import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/products/data/datasources/product_remote_datasource.dart';
import 'package:ecom/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../notifiers/product_list_notifier.dart';
import '../states/product_list_state.dart';

final productRemoteDataSourceProvider = Provider<ProductRemoteDatasource>((ref) {
  return ProductRemoteDatasource(
    ref.read(apiClientProvider)
  );
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    ref.read(productRemoteDataSourceProvider),
  );
});

final getAllProductsUseCaseProvider = Provider<GetAllProductsUseCase>((ref) {
  return GetAllProductsUseCase(
    ref.read(productRepositoryProvider),
  );
});



final productListNotifierProvider = StateNotifierProvider.autoDispose<ProductListNotifier, ProductListState>((ref) {
  return ProductListNotifier(
    ref.read(getAllProductsUseCaseProvider),
  );
});