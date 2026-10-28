import 'package:ecom/features/brand/domain/entities/brand_list_entity.dart';
import '../repositories/brand_repository.dart';

class GetAllBrandsUseCase {
  final BrandRepository _brandRepository;
  const GetAllBrandsUseCase(this._brandRepository);

  Future<BrandListEntity> call() {
    return _brandRepository.getAllBrands();
  }
}