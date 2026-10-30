import '../repositories/auth_repository.dart';

class VerifyTokenUseCase {
  final AuthRepository authRepository;

  const VerifyTokenUseCase(this.authRepository);

  Future<String> call({required String token}) {
    return authRepository.verifyToken(token: token);
  }
}
