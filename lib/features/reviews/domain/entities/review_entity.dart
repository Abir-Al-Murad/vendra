
import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String id;
  final String review;
  final int rating;
  final String productId;
  final ReviewUserEntity user;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ReviewEntity({
    required this.id,
    required this.review,
    required this.rating,
    required this.productId,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

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

class ReviewUserEntity extends Equatable {
  final String id;
  final String name;

  const ReviewUserEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
