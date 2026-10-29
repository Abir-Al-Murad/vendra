import 'package:equatable/equatable.dart';

import 'package:ecom/features/cart/domain/entities/cart_entity.dart';
import 'package:ecom/features/brand/data/models/brand_model.dart';
import 'package:ecom/features/categories/data/models/category_model.dart';
import 'package:ecom/features/categories/data/models/sub_category_model.dart';

import 'cart_item_model.dart';

class CartModel extends Equatable {
  final String id;
  final String userId;
  final List<CartItemModel> items;
  final num totalPrice;
  final int numOfCartItems;

  const CartModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.numOfCartItems,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return CartModel(
      id: data['_id'] as String,
      userId: data['cartOwner'] as String,
      items: (data['products'] as List)
          .map(
            (item) => CartItemModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      totalPrice: data['totalCartPrice'] as num,
      numOfCartItems: json['numOfCartItems'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numOfCartItems': numOfCartItems,
      'cartId': id,
      'data': {
        '_id': id,
        'cartOwner': userId,
        'products': items.map((item) => item.toJson()).toList(),
        'totalCartPrice': totalPrice,
      },
    };
  }

  CartEntity toEntity() {
    return CartEntity(
      id: id,
      userId: userId,
      items: items.map((item) => item.toEntity()).toList(),
      totalPrice: totalPrice,
      numOfCartItems: numOfCartItems,
    );
  }

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      id: entity.id,
      userId: entity.userId,
      items: entity.items
          .map((item) => CartItemModel.fromEntity(item))
          .toList(),
      totalPrice: entity.totalPrice,
      numOfCartItems: entity.numOfCartItems,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    items,
    totalPrice,
    numOfCartItems,
  ];
}

