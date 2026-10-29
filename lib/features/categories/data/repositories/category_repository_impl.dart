import 'package:ecom/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:ecom/features/categories/domain/entities/category_entity.dart';
import 'package:ecom/features/categories/domain/entities/category_list_entity.dart';
import 'package:ecom/features/categories/domain/entities/sub_category_enitity.dart';
import 'package:ecom/features/categories/domain/entities/sub_category_list_entity.dart';
import 'package:ecom/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource _categoryRemoteDataSource;

  const CategoryRepositoryImpl(this._categoryRemoteDataSource);

  @override
  Future<CategoryListEntity> getAllCategories({
    required int limit,
    required int page,
    String? keyword,
  }) {
    return _categoryRemoteDataSource.getAllCategories(
      limit: limit,
      page: page,
      keyword: keyword,
    );
  }

  @override
  Future<CategoryEntity> getSpecificCategory({required String categoryId}) {
    return _categoryRemoteDataSource
        .getSpecificCategory(categoryId: categoryId)
        .then((categoryModel) => categoryModel.toEntity());
  }

  @override
  Future<SubCategoryListEntity> getAllSubCategories({
    required int limit,
    required int page,
  }) {
    return _categoryRemoteDataSource.getAllSubCategories(
      limit: limit,
      page: page,
    );
  }

  @override
  Future<SubcategoryEntity> getSpecificSubCategory({
    required String subCategoryId,
  }) {
    return _categoryRemoteDataSource.getSpecificSubCategory(
      subCategoryId: subCategoryId,
    );
  }

  @override
  Future<SubCategoryListEntity> getAllSubCategoriesOnCategory({
    required String categoryId,
    required int limit,
    required int page,
  }) {
    return _categoryRemoteDataSource.getAllSubCategoriesOnCategory(
      categoryId: categoryId,
      limit: limit,
      page: page,
    );
  }
}
