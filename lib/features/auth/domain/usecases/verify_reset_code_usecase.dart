import '../repositories/auth_repository.dart';

class VerifyResetCodeUseCase {
  final AuthRepository authRepository;

  const VerifyResetCodeUseCase(this.authRepository);

  Future<String> call({required String code}) {
    return authRepository.verifyResetCode(code: code);
  }
}