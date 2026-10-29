import 'package:ecom/common/models/meta_data_model.dart';
import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/categories/domain/entities/category_entity.dart';
import 'package:ecom/features/categories/domain/entities/category_list_entity.dart';

import '../../../../common/entity/meta_data_entity.dart';
import '../../domain/entities/sub_category_enitity.dart';
import '../../domain/entities/sub_category_list_entity.dart';
import '../models/category_model.dart';
import '../models/sub_category_model.dart';

class CategoryRemoteDatasource {
  final ApiClient _apiClient;
  const CategoryRemoteDatasource(this._apiClient);

  Future<CategoryListEntity> getAllCategories({required int limit,required int page,String? keyword}) async {
    final response = await _apiClient.get('/categories', queryParameters: {
      'limit': limit,
      'page': page,
      if (keyword != null) 'keyword': keyword
    });
    if (response.isSuccess) {
      final categories = (response.body['data'] as List)
          .map((category) => CategoryModel.fromJson(category as Map<String, dynamic>).toEntity())
          .toList();
      return CategoryListEntity(categories: categories,metadata: MetaDataModel.fromJson(response.body['metadata']).toEntity());
    } else {
      throw response.failure ?? Exception('Failed to fetch categories');
    }
  }

  Future<CategoryModel> getSpecificCategory({required String categoryId}) async {
    final response = await _apiClient.get('/categories/$categoryId');
    if (response.isSuccess) {
      return CategoryModel.fromJson(response.body['data'] as Map<String, dynamic>);
    } else {
      throw response.failure ?? Exception('Failed to fetch category');
    }
  }

  Future<SubCategoryListEntity> getAllSubCategories({required int limit, required int page}) async {
    final response = await _apiClient.get('/subcategories', queryParameters: {
      'limit': limit,
      'page': page,
    });
    if (response.isSuccess) {
      final subcategories = (response.body['data'] as List)
          .map((subcategory) => SubcategoryModel.fromJson(subcategory as Map<String, dynamic>).toEntity())
          .toList();
      return SubCategoryListEntity(subcategories: subcategories, metadata: MetaDataModel.fromJson(response.body['metadata']).toEntity());
    } else {
      throw response.failure ?? Exception('Failed to fetch subcategories');
    }
  }

  Future<SubcategoryEntity> getSpecificSubCategory({required String subCategoryId}) async {
    final response = await _apiClient.get('/subcategories/$subCategoryId');
    if (response.isSuccess) {
      return SubcategoryModel.fromJson(response.body['data'] as Map<String, dynamic>).toEntity();
    } else {
      throw response.failure ?? Exception('Failed to fetch subcategory');
    }
  }

  Future<SubCategoryListEntity> getAllSubCategoriesOnCategory({required String categoryId, required int limit, required int page}) async {
    final response = await _apiClient.get('/subcategories/$categoryId', queryParameters: {
      'limit': limit,
      'page': page,
    });
    if (response.isSuccess) {
      final subcategories = (response.body['data'] as List)
          .map((subcategory) => SubcategoryModel.fromJson(subcategory as Map<String, dynamic>).toEntity())
          .toList();
      return SubCategoryListEntity(subcategories: subcategories, metadata: MetaDataModel.fromJson(response.body['metadata']).toEntity());
    } else {
      throw response.failure ?? Exception('Failed to fetch subcategories on category');
    }
  }
}