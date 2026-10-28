import '../entities/brand_entity.dart';
import '../repositories/brand_repository.dart';

class GetSpecificBrandUseCase {
  final BrandRepository repository;
  const GetSpecificBrandUseCase(this.repository);

  Future<BrandEntity> call({required String brandId}) {
    return repository.getSpecificBrand(brandId: brandId);
  }
}