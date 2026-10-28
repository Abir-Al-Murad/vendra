import 'package:ecom/common/entity/meta_data_entity.dart';
import 'package:ecom/core/failures/failure.dart';
import 'package:ecom/features/products/domain/entities/product_entity.dart';

class ProductListState {
  final bool isLoading;
  final List<ProductEntity> products;
  final MetaDataEntity? metaData;
  final bool isLoadingMore;
  final Failure? failure;
  ProductListState({
    required this.isLoading,
    required this.products,
    required this.metaData,
    required this.isLoadingMore,
    this.failure,
  });

  ProductListState copyWith({
    bool? isLoading,
    List<ProductEntity>? products,
    bool? isLoadingMore,
    MetaDataEntity? metaData,
    Failure? failure,
  }) {
    return ProductListState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      metaData: metaData ?? this.metaData,
      failure: failure ?? this.failure,
    );
  }
}