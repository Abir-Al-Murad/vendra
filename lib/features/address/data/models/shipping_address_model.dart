import 'package:equatable/equatable.dart';

import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel extends Equatable {
  final String details;
  final String phone;
  final String city;

  const ShippingAddressModel({
    required this.details,
    required this.phone,
    required this.city,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      details: json['details'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details,
      'phone': phone,
      'city': city,
    };
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      details: details,
      phone: phone,
      city: city,
    );
  }

  factory ShippingAddressModel.fromEntity(
      ShippingAddressEntity entity,
      ) {
    return ShippingAddressModel(
      details: entity.details,
      phone: entity.phone,
      city: entity.city,
    );
  }

  @override
  List<Object?> get props => [details, phone, city];
}