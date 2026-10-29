import 'package:ecom/features/reviews/domain/entities/review_list_entity.dart';

import '../repositories/review_repository.dart';

class GetReviewsForProductUseCase {
  final ReviewRepository _reviewRepository;

  const GetReviewsForProductUseCase(this._reviewRepository);

  Future<ReviewListEntity> call({required String productId}) {
    return _reviewRepository.getReviewsForProduct(productId: productId);
  }
}
