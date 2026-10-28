import 'package:ecom/common/entity/meta_data_entity.dart';

class MetaDataModel {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int nextPage;

  const MetaDataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });

  factory MetaDataModel.fromJson(Map<String, dynamic> json) {
    return MetaDataModel(
      currentPage: json['currentPage'] as int,
      numberOfPages: json['numberOfPages'] as int,
      limit: json['limit'] as int,
      nextPage: json['nextPage'] as int,
    );
  }

  MetaDataEntity toEntity() {
    return MetaDataEntity(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
      nextPage: nextPage,
    );
  }
}