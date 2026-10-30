import 'package:ecom/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> signIn({
    required String email,
    required String password,
  });

  Future<AuthEntity> signUp({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phoneNumber,
  });

  Future<String> forgotPassword({
    required String email,
  });

  Future<String> verifyResetCode({
    required String code,
  });

  Future<String> updatePassword({
    required String currentPassword,
    required String password,
    required String rePassword,
  });

  Future<String> resetPassword({
    required String email,
    required String newPassword,
  });

  Future<String> verifyToken({
    required String token,
  });

  Future<void> updateLoggedUserData({
    required String name,
    required String email,
    required String phone,
  });
}