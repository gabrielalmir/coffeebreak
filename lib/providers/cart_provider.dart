import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Coffee> _items = {};

  Map<String, Coffee> get items => _items;

  void addItem(Coffee coffee) {
    if (_items.containsKey(coffee.id)) {
      // Atualiza a quantidade
    } else {
      _items.putIfAbsent(coffee.id, () => coffee);
    }
    notifyListeners();
  }

  void removeItem(String coffeeId) {
    _items.remove(coffeeId);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, coffee) {
      total += coffee.price;
    });
    return total;
  }
}
