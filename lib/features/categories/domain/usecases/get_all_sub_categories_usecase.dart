import '../entities/sub_category_list_entity.dart';
import '../repositories/category_repository.dart';

class GetAllSubCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  const GetAllSubCategoriesUseCase(this._categoryRepository);

  Future<SubCategoryListEntity> call({required int limit, required int page}) {
    return _categoryRepository.getAllSubCategories(limit: limit, page: page);
  }
}
