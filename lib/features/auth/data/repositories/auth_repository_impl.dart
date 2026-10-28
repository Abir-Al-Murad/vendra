import 'package:ecom/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecom/features/auth/domain/entities/auth_entity.dart';
import 'package:ecom/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  const AuthRepositoryImpl(this._remoteDatasource);

  @override
  Future<AuthEntity> signIn({
    required String email,
    required String password,
  }) async {
    return await _remoteDatasource.signIn(
      email: email,
      password: password,
    ).then((model) => model.toEntity());
  }

  @override
  Future<AuthEntity> signUp({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phoneNumber,
  }) async {
    return await _remoteDatasource.signUp(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phoneNumber: phoneNumber,
    ).then((model) => model.toEntity());
  }

  @override
  Future<String> forgotPassword({
    required String email,
  }) async {
    return await _remoteDatasource.forgotPassword(email: email);
  }

  @override
  Future<String> verifyResetCode({
    required String code,
  }) async {
    return await _remoteDatasource.verifyResetCode(code: code);
  }

  @override
  Future<String> updatePassword({
    required String currentPassword,
    required String password,
    required String rePassword,
  }) async {
    return await _remoteDatasource.updatePassword(
      currentPassword: currentPassword,
      password: password,
      rePassword: rePassword,
    );
  }

  @override
  Future<String> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    return await _remoteDatasource.resetPassword(
      email: email,
      newPassword: newPassword,
    );
  }

  @override
  Future<void> updateLoggedUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    await _remoteDatasource.updateLoggedUserData(
      name: name,
      email: email,
      phone: phone,
    );
  }
}