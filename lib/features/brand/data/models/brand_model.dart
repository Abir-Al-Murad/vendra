import 'package:equatable/equatable.dart';
import '../../domain/entities/brand_entity.dart';

class BrandModel extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;

  const BrandModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
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

  BrandEntity toEntity() {
    return BrandEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }

  factory BrandModel.fromEntity(BrandEntity entity) {
    return BrandModel(
      id: entity.id,
      name: entity.name,
      slug: entity.slug,
      image: entity.image,
    );
  }

  @override
  List<Object?> get props => [id, name, slug, image];
}