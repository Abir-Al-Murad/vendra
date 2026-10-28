import 'package:ecom/common/models/meta_data_model.dart';
import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/brand/data/models/brand_model.dart';
import 'package:ecom/features/brand/domain/entities/brand_list_entity.dart';

class BrandRemoteDatasource {
  final ApiClient _apiClient;
  const BrandRemoteDatasource(this._apiClient);

  Future<BrandListEntity> getAllBrands({
    int? limit,
  }) async{
    final Map<String, dynamic> queryParameters = {
      if (limit != null) 'limit': limit,
    };

    return await _apiClient.get(
      '/brands',
      queryParameters: queryParameters,
    ).then((response) {
      if (response.isSuccess) {

        final metadata = response.body['metadata'];
        final brands = (response.body['data'] as List).map((e)=> BrandModel.fromJson(e).toEntity()).toList();
        return BrandListEntity(brands: brands,metaData: MetaDataModel.fromJson(metadata).toEntity());
      } else {
        throw response.failure ?? Exception('Failed to fetch brands');
      }
    });
  }

  Future<BrandModel> getBrandById(String id) async{
    return await _apiClient.get('/brands/$id').then((response) {
      if (response.isSuccess) {
        return BrandModel.fromJson(response.body['data']);
      } else {
        throw response.failure ?? Exception('Failed to fetch brand');
      }
    });
  }
}