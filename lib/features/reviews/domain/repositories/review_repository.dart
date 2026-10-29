import 'package:ecom/features/reviews/domain/entities/review_entity.dart';
import 'package:ecom/features/reviews/domain/entities/review_list_entity.dart';

abstract class ReviewRepository {
  Future<String> createReview({
    required String productId,
    required String review,
    required int rating,
  });

  Future<ReviewListEntity> getReviewsForProduct({required String productId});

  Future<ReviewListEntity> getAllReviews({
    required int limit,
    required int page,
  });

  Future<ReviewEntity> getReviewById({required String reviewId});

  Future<String> updateReview({
    required String reviewId,
    required String review,
    required int rating,
  });

  Future<String> deleteReview({required String reviewId});
}
