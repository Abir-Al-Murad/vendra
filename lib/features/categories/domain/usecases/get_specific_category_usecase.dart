import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

class GetSpecificCategoryUseCase {
  final CategoryRepository _categoryRepository;

  const GetSpecificCategoryUseCase(this._categoryRepository);

  Future<CategoryEntity> call({
    required String categoryId,
  }) {
    return _categoryRepository.getSpecificCategory(
      categoryId: categoryId,
    );
  }
}
