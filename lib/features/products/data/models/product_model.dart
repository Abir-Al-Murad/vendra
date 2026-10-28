import 'package:ecom/features/products/data/models/sub_category_model.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/product_entity.dart';
import '../../../brand/data/models/brand_model.dart';
import 'category_model.dart';

class ProductModel extends Equatable {
  final int sold;
  final List<String> images;
  final List<SubcategoryModel> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final num price;
  final String imageCover;
  final CategoryModel category;
  final BrandModel brand;
  final num ratingsAverage;
  final String createdAt;
  final String updatedAt;

  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json['sold'] as int,
      images: List<String>.from(json['images']),
      subcategory: (json['subcategory'] as List)
          .map((e) => SubcategoryModel.fromJson(e))
          .toList(),
      ratingsQuantity: json['ratingsQuantity'] as int,
      id: (json['_id'] ?? json['id']) as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as num,
      imageCover: json['imageCover'] as String,
      category: CategoryModel.fromJson(json['category']),
      brand: BrandModel.fromJson(json['brand']),
      ratingsAverage: json['ratingsAverage'] as num,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sold': sold,
      'images': images,
      'subcategory': subcategory.map((e) => e.toJson()).toList(),
      'ratingsQuantity': ratingsQuantity,
      '_id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'quantity': quantity,
      'price': price,
      'imageCover': imageCover,
      'category': category.toJson(),
      'brand': brand.toJson(),
      'ratingsAverage': ratingsAverage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      sold: sold,
      images: images,
      subcategory: subcategory.map((e) => e.toEntity()).toList(),
      ratingsQuantity: ratingsQuantity,
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: category.toEntity(),
      brand: brand.toEntity(),
      ratingsAverage: ratingsAverage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      sold: entity.sold,
      images: entity.images,
      subcategory: entity.subcategory
          .map((e) => SubcategoryModel.fromEntity(e))
          .toList(),
      ratingsQuantity: entity.ratingsQuantity,
      id: entity.id,
      title: entity.title,
      slug: entity.slug,
      description: entity.description,
      quantity: entity.quantity,
      price: entity.price,
      imageCover: entity.imageCover,
      category: CategoryModel.fromEntity(entity.category),
      brand: BrandModel.fromEntity(entity.brand),
      ratingsAverage: entity.ratingsAverage,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    sold,
    images,
    subcategory,
    ratingsQuantity,
    id,
    title,
    slug,
    description,
    quantity,
    price,
    imageCover,
    category,
    brand,
    ratingsAverage,
    createdAt,
    updatedAt,
  ];
}





