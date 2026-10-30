import 'package:ecom/core/network/api_client.dart';
import 'package:ecom/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecom/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecom/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecom/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/update_logged_user_password_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/verify_reset_code_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/verify_token_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource(ref.read(apiClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.read(authRepositoryProvider));
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.read(authRepositoryProvider));
});

final forgotPasswordUseCaseProvider = Provider<ForgotPasswordUseCase>((ref) {
  return ForgotPasswordUseCase(ref.read(authRepositoryProvider));
});

final verifyResetCodeUseCaseProvider = Provider<VerifyResetCodeUseCase>((ref) {
  return VerifyResetCodeUseCase(ref.read(authRepositoryProvider));
});

final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>((ref) {
  return ResetPasswordUseCase(ref.read(authRepositoryProvider));
});

final updateLoggedUserPasswordUseCaseProvider =
    Provider<UpdateLoggedUserPasswordUseCase>((ref) {
      return UpdateLoggedUserPasswordUseCase(ref.read(authRepositoryProvider));
    });

final verifyTokenUseCaseProvider = Provider<VerifyTokenUseCase>((ref) {
  return VerifyTokenUseCase(ref.read(authRepositoryProvider));
});
