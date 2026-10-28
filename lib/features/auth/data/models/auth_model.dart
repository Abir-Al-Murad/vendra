import 'package:ecom/features/auth/domain/entities/auth_entity.dart';

class AuthModel {
  final String userName;
  final String email;
  final String role;
  final String accessToken;

  const AuthModel({
    required this.userName,
    required this.email,
    required this.role,
    required this.accessToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userName: json['user']['name'] as String,
      email: json['user']['email'] as String,
      role: json['user']['role'] as String,
      accessToken: json['token'] as String,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      userName: userName,
      email: email,
      role: role,
      accessToken: accessToken,
    );
  }

  AuthModel fromEntity(AuthEntity entity) {
    return AuthModel(
      userName: entity.userName,
      email: entity.email,
      role: entity.role,
      accessToken: entity.accessToken,
    );
  }
}