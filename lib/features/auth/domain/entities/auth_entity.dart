import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String userName;
  final String email;
  final String role;
  final String accessToken;

  const AuthEntity({
    required this.userName,
    required this.email,
    required this.role,
    required this.accessToken,
  });

  @override
  List<Object?> get props => [userName, email, role, accessToken];
}