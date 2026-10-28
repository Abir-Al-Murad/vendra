import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;
  const SignInUseCase(this._authRepository);
  Future<AuthEntity> call({
    required String email,
    required String password,
  }) {
    return _authRepository.signIn(
      email: email,
      password: password,
    );
  }
}