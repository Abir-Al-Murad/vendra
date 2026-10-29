import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/reviews/data/models/review_model.dart';
import 'package:ecom/features/reviews/domain/entities/review_entity.dart';
import 'package:ecom/features/reviews/domain/entities/review_list_entity.dart';

import '../../../../common/models/meta_data_model.dart';

class ReviewsRemoteDatasource {
  final ApiClient _apiClient;
  const ReviewsRemoteDatasource(this._apiClient);

  Future<String> createReview({required String productId, required String review, required int rating}) async {
    final response = await _apiClient.post(
      '/products/$productId/reviews',
      data: {
        'review': review,
        'rating': rating,
      },
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to create review');
    }
  }

  Future<ReviewListEntity> getReviewsForProduct({required String productId}) async {
    final response = await _apiClient.get(
      '/products/$productId/reviews',
    );
    if (response.isSuccess) {
      final reviews = (response.body['data'] as List)
          .map((review) => ReviewModel.fromJson(review as Map<String, dynamic>).toEntity())
          .toList();
      return ReviewListEntity(reviews: reviews, metadata: MetaDataModel.fromJson(response.body['metadata']).toEntity());
    } else {
      throw response.failure ?? Exception('Failed to get reviews for product');
    }
  }

  Future<ReviewListEntity> getAllReviews({required int limit, required int page}) async {
    final response = await _apiClient.get(
      '/reviews',
      queryParameters: {
        'limit': limit,
        'page': page,
      },
    );
    if (response.isSuccess) {
      final reviews = (response.body['data'] as List)
          .map((review) => ReviewModel.fromJson(review as Map<String, dynamic>).toEntity())
          .toList();
      return ReviewListEntity(reviews: reviews, metadata: MetaDataModel.fromJson(response.body['metadata']).toEntity());
    } else {
      throw response.failure ?? Exception('Failed to get all reviews');
    }
  }

  Future<ReviewModel> getReviewById({required String reviewId}) async {
    final response = await _apiClient.get(
      '/reviews/$reviewId',
    );
    if (response.isSuccess) {
      return ReviewModel.fromJson(response.body['data'] as Map<String, dynamic>);
    } else {
      throw response.failure ?? Exception('Failed to get review by id');
    }
  }

  Future<String> updateReview({required String reviewId, required String review, required int rating}) async {
    final response = await _apiClient.put(
      '/reviews/$reviewId',
      data: {
        'review': review,
        'rating': rating,
      },
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to update review');
    }
  }

  Future<String> deleteReview({required String reviewId}) async {
    final response = await _apiClient.delete(
      '/reviews/$reviewId',
    );
    if (response.isSuccess) {
      return response.body['message'] as String;
    } else {
      throw response.failure ?? Exception('Failed to delete review');
    }
  }



}