import 'package:equatable/equatable.dart';

import '../../../address/data/models/shipping_address_model.dart';
import '../../domain/entities/order_entity.dart';
import '../../../cart/data/models/cart_item_model.dart';
import 'order_user_model.dart';

class OrderModel extends Equatable {
  final String id;
  final int orderNumber;
  final OrderUserModel user;
  final ShippingAddressModel shippingAddress;
  final List<CartItemModel> cartItems;
  final num taxPrice;
  final num shippingPrice;
  final num totalOrderPrice;
  final String paymentMethodType;
  final bool isPaid;
  final bool isDelivered;
  final DateTime? paidAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OrderModel({
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

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] as String,
      orderNumber: json['id'] as int,
      user: OrderUserModel.fromJson(
        json['user'] as Map<String, dynamic>,
      ),
      shippingAddress: ShippingAddressModel.fromJson(
        json['shippingAddress'] as Map<String, dynamic>,
      ),
      cartItems: (json['cartItems'] as List)
          .map(
            (item) => CartItemModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      taxPrice: json['taxPrice'] as num,
      shippingPrice: json['shippingPrice'] as num,
      totalOrderPrice: json['totalOrderPrice'] as num,
      paymentMethodType: json['paymentMethodType'] as String,
      isPaid: json['isPaid'] as bool,
      isDelivered: json['isDelivered'] as bool,
      paidAt: json['paidAt'] != null
          ? DateTime.tryParse(json['paidAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'id': orderNumber,
      'user': user.toJson(),
      'shippingAddress': shippingAddress.toJson(),
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
      'taxPrice': taxPrice,
      'shippingPrice': shippingPrice,
      'totalOrderPrice': totalOrderPrice,
      'paymentMethodType': paymentMethodType,
      'isPaid': isPaid,
      'isDelivered': isDelivered,
      'paidAt': paidAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      orderNumber: orderNumber,
      user: user.toEntity(),
      shippingAddress: shippingAddress.toEntity(),
      cartItems: cartItems.map((item) => item.toEntity()).toList(),
      taxPrice: taxPrice,
      shippingPrice: shippingPrice,
      totalOrderPrice: totalOrderPrice,
      paymentMethodType: paymentMethodType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      paidAt: paidAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      orderNumber: entity.orderNumber,
      user: OrderUserModel.fromEntity(entity.user),
      shippingAddress: ShippingAddressModel.fromEntity(
        entity.shippingAddress,
      ),
      cartItems: entity.cartItems
          .map((item) => CartItemModel.fromEntity(item))
          .toList(),
      taxPrice: entity.taxPrice,
      shippingPrice: entity.shippingPrice,
      totalOrderPrice: entity.totalOrderPrice,
      paymentMethodType: entity.paymentMethodType,
      isPaid: entity.isPaid,
      isDelivered: entity.isDelivered,
      paidAt: entity.paidAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

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