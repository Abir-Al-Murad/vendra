import '../entities/sub_category_enitity.dart';
import '../repositories/category_repository.dart';

class GetSpecificSubCategoryUseCase {
  final CategoryRepository _categoryRepository;

  const GetSpecificSubCategoryUseCase(this._categoryRepository);

  Future<SubcategoryEntity> call({required String subCategoryId}) {
    return _categoryRepository.getSpecificSubCategory(
      subCategoryId: subCategoryId,
    );
  }
}
