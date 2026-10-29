import '../entities/category_list_entity.dart';
import '../repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  const GetAllCategoriesUseCase(this._categoryRepository);

  Future<CategoryListEntity> call({
    required int limit,
    required int page,
    String? keyword,
  }) {
    return _categoryRepository.getAllCategories(
      limit: limit,
      page: page,
      keyword: keyword,
    );
  }
}
