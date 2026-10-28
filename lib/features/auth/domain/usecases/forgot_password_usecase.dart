import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository authRepository;
  const ForgotPasswordUseCase(this.authRepository);

  Future<String> call({required String email}) {
    return authRepository.forgotPassword(email: email);
  }
}