// Category Model

import 'package:equatable/equatable.dart';

import '../../domain/entities/category_entity.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: (json['_id'] ?? json['id']) as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      slug: entity.slug,
      image: entity.image,
    );
  }

  @override
  List<Object?> get props => [id, name, slug, image];
}