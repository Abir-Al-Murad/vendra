import '../repositories/review_repository.dart';

class DeleteReviewUseCase {
  final ReviewRepository _reviewRepository;

  const DeleteReviewUseCase(this._reviewRepository);

  Future<String> call({required String reviewId}) {
    return _reviewRepository.deleteReview(reviewId: reviewId);
  }
}
