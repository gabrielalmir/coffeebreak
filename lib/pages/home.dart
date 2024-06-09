
import 'package:coffeebreak/models/coffee.dart';
import 'package:coffeebreak/providers/cart_provider.dart';
import 'package:coffeebreak/widgets/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  final List<Coffee> loadedCoffees = [
    Coffee(
      id: 'c1',
      name: 'Americano',
      description: 'Espresso com água quente',
      price: 15.000,
      imageUrl:
      'assets/americano.jpg',
    ),
    Coffee(
      id: 'c2',
      name: 'Cappuccino',
      description: 'Espresso com espumante',
      price: 25.000,
      imageUrl:
      'assets/cappuccino.jpg',
    ),
    Coffee(
      id: 'c3',
      name: 'Macchiato',
      description: 'Espresso com leite',
      price: 25.000,
      imageUrl:
      'assets/macchiato.jpg',
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.coffee),
            SizedBox(width: 8), // Espaço entre o ícone e o texto
            Text('break'),
          ],
        ),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            // Add cart count
            icon: Row(
              children: [
                const Icon(Icons.shopping_cart),
                if (cart.items.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      '${cart.totalQuantity}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown,
                        Colors.brown,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/americano.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    'Que tal um Cafézinho?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: Center(
                child: Text(
                  'Café Quente',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: loadedCoffees.length,
                itemBuilder: (ctx, i) => CoffeeItem(loadedCoffees[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
