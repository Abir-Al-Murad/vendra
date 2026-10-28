import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  const SignUpUseCase(this._authRepository);

  Future<AuthEntity> call({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phoneNumber,
  }) {
    return _authRepository.signUp(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phoneNumber: phoneNumber,
    );
  }
}