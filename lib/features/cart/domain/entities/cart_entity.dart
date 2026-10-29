import 'package:equatable/equatable.dart';
import 'cart_item_entity.dart';

class CartEntity extends Equatable {
  final String id;
  final String userId;
  final List<CartItemEntity> items;
  final num totalPrice;
  final int numOfCartItems;

  const CartEntity({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.numOfCartItems,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    items,
    totalPrice,
    numOfCartItems,
  ];
}

