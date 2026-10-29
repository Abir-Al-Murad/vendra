import 'package:equatable/equatable.dart';

import '../../../brand/domain/entities/brand_entity.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../../categories/domain/entities/sub_category_enitity.dart';

class CartItemEntity extends Equatable {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final String imageCover;
  final num ratingsAverage;
  final CategoryEntity category;
  final BrandEntity brand;
  final List<SubcategoryEntity> subcategory;
  final int count;
  final num price;

  const CartItemEntity({
    required this.id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.ratingsAverage,
    required this.category,
    required this.brand,
    required this.subcategory,
    required this.count,
    required this.price,
  });

  @override
  List<Object?> get props => [
    id,
    productId,
    title,
    quantity,
    imageCover,
    ratingsAverage,
    category,
    brand,
    subcategory,
    count,
    price,
  ];
}