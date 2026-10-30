import 'package:equatable/equatable.dart';

import '../../domain/entities/order_user_entity.dart';

class OrderUserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;

  const OrderUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory OrderUserModel.fromJson(Map<String, dynamic> json) {
    return OrderUserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  OrderUserEntity toEntity() {
    return OrderUserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
    );
  }

  factory OrderUserModel.fromEntity(OrderUserEntity entity) {
    return OrderUserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
    );
  }

  @override
  List<Object?> get props => [id, name, email, phone];
}