import 'package:ecom/features/categories/domain/entities/category_entity.dart';
import 'package:ecom/features/categories/domain/entities/category_list_entity.dart';
import 'package:ecom/features/categories/domain/entities/sub_category_enitity.dart';
import 'package:ecom/features/categories/domain/entities/sub_category_list_entity.dart';

abstract class CategoryRepository {
    Future<CategoryListEntity> getAllCategories({required int limit,required int page,String? keyword});
    Future<CategoryEntity> getSpecificCategory({required String categoryId});
    Future<SubCategoryListEntity> getAllSubCategories({required int limit,required int page});
    Future<SubcategoryEntity> getSpecificSubCategory({required String subCategoryId});
    Future<SubCategoryListEntity> getAllSubCategoriesOnCategory({required String categoryId,required int limit,required int page});
}