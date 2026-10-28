import 'package:ecom/common/entity/meta_data_entity.dart';
import 'package:ecom/features/products/domain/entities/product_entity.dart';

class ProductListEntity {
  final List<ProductEntity> products;
  final MetaDataEntity metaData;

  const ProductListEntity({
    required this.products,
    required this.metaData,
  });
}