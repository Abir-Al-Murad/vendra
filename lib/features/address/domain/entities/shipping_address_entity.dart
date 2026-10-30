import 'package:equatable/equatable.dart';

class ShippingAddressEntity extends Equatable {
  final String details;
  final String phone;
  final String city;

  const ShippingAddressEntity({
    required this.details,
    required this.phone,
    required this.city,
  });

  @override
  List<Object?> get props => [
    details,
    phone,
    city,
  ];
}