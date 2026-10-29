import 'package:ecom/common/entity/meta_data_entity.dart';
import 'package:ecom/features/categories/domain/entities/sub_category_enitity.dart';

class SubCategoryListEntity {
  final List<SubcategoryEntity> subcategories;
  final MetaDataEntity metadata;

  SubCategoryListEntity({
    required this.subcategories,
    required this.metadata,
  });
}