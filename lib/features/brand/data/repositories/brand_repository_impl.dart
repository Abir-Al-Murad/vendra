import 'package:ecom/features/brand/data/datasources/brand_remote_datasource.dart';
import 'package:ecom/features/brand/domain/entities/brand_entity.dart';
import 'package:ecom/features/brand/domain/entities/brand_list_entity.dart';
import 'package:ecom/features/brand/domain/repositories/brand_repository.dart';

class BrandRepositoryImpl implements BrandRepository{
  final BrandRemoteDatasource _remoteDatasource;
  const BrandRepositoryImpl(this._remoteDatasource);
  @override
  Future<BrandListEntity> getAllBrands({int? limit}) {
    return _remoteDatasource.getAllBrands(limit: limit);
  }

  @override
  Future<BrandEntity> getSpecificBrand({required String brandId}) {
    return _remoteDatasource.getBrandById(brandId).then((model) => model.toEntity());
  }

}