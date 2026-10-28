import 'package:ecom/features/products/domain/entities/product_entity.dart';
import 'package:ecom/features/products/domain/entities/product_list_entity.dart';

abstract class ProductRepository {
  Future<ProductListEntity> getAllProducts({
    int? limit,
    String? sort,
    String? fields,
    num? priceGte,
    num? priceLte,
    int? page,
    String? keyword,
    String? brand,
    List<String>? categoryIn,
  });

  Future<ProductEntity> getSpecificProduct({
    required String productId,
  });
}