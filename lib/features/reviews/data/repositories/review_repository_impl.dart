import 'package:ecom/features/reviews/data/datasources/reviews_remote_datasource.dart';
import 'package:ecom/features/reviews/domain/entities/review_entity.dart';
import 'package:ecom/features/reviews/domain/entities/review_list_entity.dart';
import 'package:ecom/features/reviews/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewsRemoteDatasource _reviewsRemoteDatasource;

  const ReviewRepositoryImpl(this._reviewsRemoteDatasource);

  @override
  Future<String> createReview({
    required String productId,
    required String review,
    required int rating,
  }) {
    return _reviewsRemoteDatasource.createReview(
      productId: productId,
      review: review,
      rating: rating,
    );
  }

  @override
  Future<ReviewListEntity> getReviewsForProduct({required String productId}) {
    return _reviewsRemoteDatasource.getReviewsForProduct(productId: productId);
  }

  @override
  Future<ReviewListEntity> getAllReviews({
    required int limit,
    required int page,
  }) {
    return _reviewsRemoteDatasource.getAllReviews(limit: limit, page: page);
  }

  @override
  Future<ReviewEntity> getReviewById({required String reviewId}) async {
    final reviewModel = await _reviewsRemoteDatasource.getReviewById(
      reviewId: reviewId,
    );
    return reviewModel.toEntity();
  }

  @override
  Future<String> updateReview({
    required String reviewId,
    required String review,
    required int rating,
  }) {
    return _reviewsRemoteDatasource.updateReview(
      reviewId: reviewId,
      review: review,
      rating: rating,
    );
  }

  @override
  Future<String> deleteReview({required String reviewId}) {
    return _reviewsRemoteDatasource.deleteReview(reviewId: reviewId);
  }
}
