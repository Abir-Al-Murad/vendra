import 'package:equatable/equatable.dart';

import '../../../address/domain/entities/shipping_address_entity.dart';
import '../../../cart/domain/entities/cart_item_entity.dart';
import 'order_user_entity.dart';


class OrderEntity extends Equatable {
  final String id;
  final int orderNumber;

  final OrderUserEntity user;
  final ShippingAddressEntity shippingAddress;

  final List<CartItemEntity> cartItems;

  final num taxPrice;
  final num shippingPrice;
  final num totalOrderPrice;

  final String paymentMethodType;

  final bool isPaid;
  final bool isDelivered;

  final DateTime? paidAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OrderEntity({
    required this.id,
    required this.orderNumber,
    required this.user,
    required this.shippingAddress,
    required this.cartItems,
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalOrderPrice,
    required this.paymentMethodType,
    required this.isPaid,
    required this.isDelivered,
    this.paidAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    orderNumber,
    user,
    shippingAddress,
    cartItems,
    taxPrice,
    shippingPrice,
    totalOrderPrice,
    paymentMethodType,
    isPaid,
    isDelivered,
    paidAt,
    createdAt,
    updatedAt,
  ];
}