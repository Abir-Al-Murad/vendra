import 'package:ecom/features/reviews/domain/entities/review_entity.dart';

import '../repositories/review_repository.dart';

class GetReviewByIdUseCase {
  final ReviewRepository _reviewRepository;

  const GetReviewByIdUseCase(this._reviewRepository);

  Future<ReviewEntity> call({required String reviewId}) {
    return _reviewRepository.getReviewById(reviewId: reviewId);
  }
}
