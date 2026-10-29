import '../entities/sub_category_list_entity.dart';
import '../repositories/category_repository.dart';

class GetAllSubCategoriesOnCategoryUseCase {
  final CategoryRepository _categoryRepository;

  const GetAllSubCategoriesOnCategoryUseCase(this._categoryRepository);

  Future<SubCategoryListEntity> call({
    required String categoryId,
    required int limit,
    required int page,
  }) {
    return _categoryRepository.getAllSubCategoriesOnCategory(
      categoryId: categoryId,
      limit: limit,
      page: page,
    );
  }
}
