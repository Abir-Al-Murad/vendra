import '../repositories/review_repository.dart';

class CreateReviewUseCase {
  final ReviewRepository _reviewRepository;

  const CreateReviewUseCase(this._reviewRepository);

  Future<String> call({
    required String productId,
    required String review,
    required int rating,
  }) {
    return _reviewRepository.createReview(
      productId: productId,
      review: review,
      rating: rating,
    );
  }
}
