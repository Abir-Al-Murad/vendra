import 'package:ecom/features/brand/domain/entities/brand_entity.dart';
import 'package:ecom/features/brand/domain/entities/brand_list_entity.dart';

abstract class BrandRepository {
  Future<BrandListEntity> getAllBrands({
    int? limit,
  });

  Future<BrandEntity> getSpecificBrand({
    required String brandId,
  });
}