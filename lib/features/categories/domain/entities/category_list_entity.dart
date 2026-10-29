import 'package:ecom/common/entity/meta_data_entity.dart';

import 'category_entity.dart';

class CategoryListEntity {
  final List<CategoryEntity> categories;
  final MetaDataEntity metadata;

  const CategoryListEntity({
    required this.categories,
    required this.metadata,
  });

}