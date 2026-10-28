import 'package:ecom/features/products/data/datasources/product_remote_datasource.dart';
import 'package:ecom/features/products/domain/entities/product_entity.dart';
import 'package:ecom/features/products/domain/entities/product_list_entity.dart';
import 'package:ecom/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource _remoteDatasource;

  const ProductRepositoryImpl(this._remoteDatasource);

  @override
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
  }) async {
    return await _remoteDatasource.getAllProducts(
      limit: limit,
      sort: sort,
      fields: fields,
      priceGte: priceGte,
      priceLte: priceLte,
      page: page,
      keyword: keyword,
      brand: brand,
      categoryIn: categoryIn,
    );
  }

  @override
  Future<ProductEntity> getSpecificProduct({
    required String productId,
  }) async {
    final productModel = await _remoteDatasource.getSpecificProduct(
      productId: productId,
    );

    return productModel.toEntity();
  }
}