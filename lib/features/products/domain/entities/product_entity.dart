import 'package:ecom/features/products/domain/entities/sub_category_enitity.dart';

import '../../../brand/domain/entities/brand_entity.dart';
import '../../../categories/domain/entities/category_entity.dart';

class ProductEntity {
  final int sold;
  final List<String> images;
  final List<SubcategoryEntity> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final num price;
  final String imageCover;
  final CategoryEntity category;
  final BrandEntity brand;
  final num ratingsAverage;
  final String createdAt;
  final String updatedAt;

  const ProductEntity({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });
}




