import 'package:equatable/equatable.dart';

class MetaDataEntity extends Equatable {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int nextPage;

  const MetaDataEntity({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });

  @override
  List<Object?> get props => [
    currentPage,
    numberOfPages,
    limit,
    nextPage,
  ];
}