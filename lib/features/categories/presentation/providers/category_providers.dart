import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/usecases/get_all_categories_usecase.dart';
import '../../domain/usecases/get_specific_category_usecase.dart';


final categoryRemoteDataSourceProvider = Provider<CategoryRemoteDatasource>((ref){
  return CategoryRemoteDatasource(ref.read(apiClientProvider));
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref){
  return CategoryRepositoryImpl(ref.read(categoryRemoteDataSourceProvider));
});

final getAllCategoriesUseCaseProvider = Provider<GetAllCategoriesUseCase>((ref){
  return GetAllCategoriesUseCase(ref.read(categoryRepositoryProvider));
});

final getSpecificCategoryUseCaseProvider = Provider<GetSpecificCategoryUseCase>((ref){
  return GetSpecificCategoryUseCase(ref.read(categoryRepositoryProvider));
});