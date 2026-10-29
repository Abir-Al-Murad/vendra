import 'package:ecom/features/categories/domain/entities/category_entity.dart';
import 'package:ecom/features/categories/domain/entities/category_list_entity.dart';

abstract class CategoryRepository {
    Future<CategoryListEntity> getAllCategories({required int limit,required int page,String? keyword});
    Future<CategoryEntity> getSpecificCategory({required String categoryId});
}