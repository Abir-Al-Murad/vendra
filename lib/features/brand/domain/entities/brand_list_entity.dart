import 'package:ecom/common/entity/meta_data_entity.dart';

import 'brand_entity.dart';

class BrandListEntity {
  final List<BrandEntity> brands;
  final MetaDataEntity metaData;

  const BrandListEntity({
    required this.brands,
    required this.metaData,
  });
}