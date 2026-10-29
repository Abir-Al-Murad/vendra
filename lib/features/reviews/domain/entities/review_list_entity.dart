import 'package:ecom/common/entity/meta_data_entity.dart';
import 'package:ecom/features/reviews/domain/entities/review_entity.dart';

class ReviewListEntity {
  final List<ReviewEntity> reviews;
  final MetaDataEntity metadata;

  const ReviewListEntity({
    required this.reviews,
    required this.metadata,
  });
}