
import 'package:equatable/equatable.dart';
import 'package:ecom/features/reviews/domain/entities/review_entity.dart';

class ReviewModel extends Equatable {
  final String id;
  final String review;
  final int rating;
  final String productId;
  final ReviewUserModel user;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ReviewModel({
    required this.id,
    required this.review,
    required this.rating,
    required this.productId,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toInt(),
      productId: json['product'] as String,
      user: ReviewUserModel.fromJson(
        json['user'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'review': review,
      'rating': rating,
      'product': productId,
      'user': user.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      review: review,
      rating: rating,
      productId: productId,
      user: user.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      id: entity.id,
      review: entity.review,
      rating: entity.rating,
      productId: entity.productId,
      user: ReviewUserModel.fromEntity(entity.user),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    review,
    rating,
    productId,
    user,
    createdAt,
    updatedAt,
  ];
}

class ReviewUserModel extends Equatable {
  final String id;
  final String name;

  const ReviewUserModel({
    required this.id,
    required this.name,
  });

  factory ReviewUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewUserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }

  ReviewUserEntity toEntity() {
    return ReviewUserEntity(
      id: id,
      name: name,
    );
  }

  factory ReviewUserModel.fromEntity(ReviewUserEntity entity) {
    return ReviewUserModel(
      id: entity.id,
      name: entity.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
