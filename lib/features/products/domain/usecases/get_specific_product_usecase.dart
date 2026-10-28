import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetSpecificProductUseCase {
  final ProductRepository _productRepository;

  const GetSpecificProductUseCase(this._productRepository);

  Future<ProductEntity> call({
    required String productId,
  }) {
    return _productRepository.getSpecificProduct(
      productId: productId,
    );
  }
}
