// Subcategory Model

import 'package:equatable/equatable.dart';

import '../../domain/entities/sub_category_enitity.dart';

class SubcategoryModel extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String categoryId;

  const SubcategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.categoryId,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryModel(
      id: (json['_id'] ?? json['id']) as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      categoryId: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'category': categoryId,
    };
  }

  SubcategoryEntity toEntity() {
    return SubcategoryEntity(
      id: id,
      name: name,
      slug: slug,
      categoryId: categoryId,
    );
  }

  factory SubcategoryModel.fromEntity(SubcategoryEntity entity) {
    return SubcategoryModel(
      id: entity.id,
      name: entity.name,
      slug: entity.slug,
      categoryId: entity.categoryId,
    );
  }

  @override
  List<Object?> get props => [id, name, slug, categoryId];
}