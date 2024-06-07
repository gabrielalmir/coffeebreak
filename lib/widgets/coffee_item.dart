import 'package:coffeebreak/models/coffee.dart';
import 'package:coffeebreak/providers/cart_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CoffeeItem extends StatelessWidget {
  final Coffee coffee;

  const CoffeeItem(this.coffee, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coffee-detail',
          arguments: coffee,
        );
      },
      child: Card(
        color: Colors.grey[100],
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              coffee.imageUrl,
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
          ),
          title: Text(
            coffee.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(coffee.description),
          trailing: IconButton(
            icon: const Icon(Icons.add, color: Colors.orange),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addItem(coffee);
            },
          ),
        ),
      ),
    );
  }
}
