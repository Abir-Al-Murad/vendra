import '../entities/product_list_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository _productRepository;

  const GetAllProductsUseCase(this._productRepository);

  Future<ProductListEntity> call({
    int? limit,
    String? sort,
    String? fields,
    num? priceGte,
    num? priceLte,
    int? page,
    String? keyword,
    String? brand,
    List<String>? categoryIn,
  }) {
    return _productRepository.getAllProducts(
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
}
