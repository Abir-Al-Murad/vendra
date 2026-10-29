import 'package:equatable/equatable.dart';

import '../../../brand/data/models/brand_model.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/data/models/sub_category_model.dart';
import '../../domain/entities/cart_item_entity.dart';

class CartItemModel extends Equatable {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final String imageCover;
  final num ratingsAverage;
  final CategoryModel category;
  final BrandModel brand;
  final List<SubcategoryModel> subcategory;
  final int count;
  final num price;

  const CartItemModel({
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

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final product = json['product'] as Map<String, dynamic>;

    return CartItemModel(
      id: json['_id'] as String,
      productId: (product['_id'] ?? product['id']) as String,
      title: product['title'] as String,
      quantity: product['quantity'] as int,
      imageCover: product['imageCover'] as String,
      ratingsAverage: product['ratingsAverage'] as num,
      category: CategoryModel.fromJson(
        product['category'] as Map<String, dynamic>,
      ),
      brand: BrandModel.fromJson(
        product['brand'] as Map<String, dynamic>,
      ),
      subcategory: (product['subcategory'] as List)
          .map(
            (item) => SubcategoryModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      count: json['count'] as int,
      price: json['price'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'count': count,
      'price': price,
      'product': {
        '_id': productId,
        'title': title,
        'quantity': quantity,
        'imageCover': imageCover,
        'ratingsAverage': ratingsAverage,
        'category': category.toJson(),
        'brand': brand.toJson(),
        'subcategory': subcategory.map((item) => item.toJson()).toList(),
      },
    };
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      productId: productId,
      title: title,
      quantity: quantity,
      imageCover: imageCover,
      ratingsAverage: ratingsAverage,
      category: category.toEntity(),
      brand: brand.toEntity(),
      subcategory: subcategory.map((item) => item.toEntity()).toList(),
      count: count,
      price: price,
    );
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      id: entity.id,
      productId: entity.productId,
      title: entity.title,
      quantity: entity.quantity,
      imageCover: entity.imageCover,
      ratingsAverage: entity.ratingsAverage,
      category: CategoryModel.fromEntity(entity.category),
      brand: BrandModel.fromEntity(entity.brand),
      subcategory: entity.subcategory
          .map((item) => SubcategoryModel.fromEntity(item))
          .toList(),
      count: entity.count,
      price: entity.price,
    );
  }

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