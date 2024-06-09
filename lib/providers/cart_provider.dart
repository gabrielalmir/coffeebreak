import 'package:coffeebreak/models/coffee.dart';
import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItemModel> _items = {};

  Map<String, CartItemModel> get items => _items;

  void addItem(Coffee coffee) {
    if (_items.containsKey(coffee.id)) {
      _items.update(
        coffee.id,
            (existingCartItem) => CartItemModel(
          id: existingCartItem.id,
          name: existingCartItem.name,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
          imageUrl: existingCartItem.imageUrl,
        ),
      );
    } else {
      _items.putIfAbsent(
        coffee.id,
            () => CartItemModel(
          id: coffee.id,
          name: coffee.name,
          quantity: 1,
          price: coffee.price,
          imageUrl: coffee.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String coffeeId) {
    _items.remove(coffeeId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get totalQuantity {
    var total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.quantity;
    });
    return total;
  }
}
