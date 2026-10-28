import '../repositories/auth_repository.dart';

class UpdateLoggedUserPasswordUseCase {
  final AuthRepository authRepository;

  const UpdateLoggedUserPasswordUseCase(this.authRepository);

  Future<String> call({required String currentPassword, required String password, required String rePassword}) {
    return authRepository.updatePassword(currentPassword: currentPassword, password: password, rePassword: rePassword);
  }
}