import 'package:ecom/features/reviews/domain/entities/review_list_entity.dart';

import '../repositories/review_repository.dart';

class GetAllReviewsUseCase {
  final ReviewRepository _reviewRepository;

  const GetAllReviewsUseCase(this._reviewRepository);

  Future<ReviewListEntity> call({required int limit, required int page}) {
    return _reviewRepository.getAllReviews(limit: limit, page: page);
  }
}
