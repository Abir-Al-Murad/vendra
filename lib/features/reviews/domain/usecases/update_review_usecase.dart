import '../repositories/review_repository.dart';

class UpdateReviewUseCase {
  final ReviewRepository _reviewRepository;

  const UpdateReviewUseCase(this._reviewRepository);

  Future<String> call({
    required String reviewId,
    required String review,
    required int rating,
  }) {
    return _reviewRepository.updateReview(
      reviewId: reviewId,
      review: review,
      rating: rating,
    );
  }
}
