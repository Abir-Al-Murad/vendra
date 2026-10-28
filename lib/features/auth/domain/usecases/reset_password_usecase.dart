import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository authRepository;

  const ResetPasswordUseCase(this.authRepository);

  Future<String> call({required String email, required String newPassword}) {
    return authRepository.resetPassword(email: email, newPassword: newPassword);
  }
}