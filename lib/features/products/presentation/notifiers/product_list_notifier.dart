import 'package:ecom/core/failures/failure.dart';
import 'package:ecom/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/product_list_state.dart';

class ProductListNotifier extends StateNotifier<ProductListState> {
  final GetAllProductsUseCase _getAllProductsUseCase;

  ProductListNotifier(this._getAllProductsUseCase)
      : super(
          ProductListState(
            isLoading: false,
            products: const [],
            metaData: null,
            isLoadingMore: false,
            failure: null,
          ),
        );

  Future<void> getAllProducts() async {
    int page = 1;
    int limit = 10;
    state = state.copyWith(
      isLoading: true,
      isLoadingMore: false,
      failure: null,
    );
    try {
      final data = await _getAllProductsUseCase(
        page: page,
        limit: limit,
      );

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        products: data.products,
        metaData: data.metaData,
        failure: null,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        failure: error is Failure ? error : UnknownFailure(error.toString()),
      );
    }
  }

  Future<void> loadMoreProducts() async {
    if (state.isLoading || state.isLoadingMore) {
      return;
    }

    final metaData = state.metaData;
    if (metaData == null || metaData.nextPage == 0) {
      return;
    }

    state = state.copyWith(
      isLoading: false,
      isLoadingMore: true,
      failure: null,
    );

    try {
      final data = await _getAllProductsUseCase(
        page: metaData.nextPage,
        limit: metaData.limit,
      );

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        products: [...state.products, ...data.products],
        metaData: data.metaData,
        failure: null,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        failure: error is Failure ? error : UnknownFailure(error.toString()),
      );
    }
  }

  void clearProductListState() {
    state = ProductListState(
      isLoading: false,
      products: const [],
      metaData: null,
      isLoadingMore: false,
      failure: null,
    );
  }
}