import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/reviews/data/datasources/reviews_remote_datasource.dart';
import 'package:ecom/features/reviews/data/repositories/review_repository_impl.dart';
import 'package:ecom/features/reviews/domain/repositories/review_repository.dart';
import 'package:ecom/features/reviews/domain/usecases/create_review_usecase.dart';
import 'package:ecom/features/reviews/domain/usecases/delete_review_usecase.dart';
import 'package:ecom/features/reviews/domain/usecases/get_all_reviews_usecase.dart';
import 'package:ecom/features/reviews/domain/usecases/get_review_by_id_usecase.dart';
import 'package:ecom/features/reviews/domain/usecases/get_reviews_for_product_usecase.dart';
import 'package:ecom/features/reviews/domain/usecases/update_review_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewsRemoteDataSourceProvider = Provider<ReviewsRemoteDatasource>((
  ref,
) {
  return ReviewsRemoteDatasource(ref.read(apiClientProvider));
});

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepositoryImpl(ref.read(reviewsRemoteDataSourceProvider));
});

final createReviewUseCaseProvider = Provider<CreateReviewUseCase>((ref) {
  return CreateReviewUseCase(ref.read(reviewRepositoryProvider));
});

final getReviewsForProductUseCaseProvider =
    Provider<GetReviewsForProductUseCase>((ref) {
      return GetReviewsForProductUseCase(ref.read(reviewRepositoryProvider));
    });

final getAllReviewsUseCaseProvider = Provider<GetAllReviewsUseCase>((ref) {
  return GetAllReviewsUseCase(ref.read(reviewRepositoryProvider));
});

final getReviewByIdUseCaseProvider = Provider<GetReviewByIdUseCase>((ref) {
  return GetReviewByIdUseCase(ref.read(reviewRepositoryProvider));
});

final updateReviewUseCaseProvider = Provider<UpdateReviewUseCase>((ref) {
  return UpdateReviewUseCase(ref.read(reviewRepositoryProvider));
});

final deleteReviewUseCaseProvider = Provider<DeleteReviewUseCase>((ref) {
  return DeleteReviewUseCase(ref.read(reviewRepositoryProvider));
});
