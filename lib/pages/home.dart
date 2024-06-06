import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../widgets/coffee_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Coffee> loadedCoffees = [
    Coffee(
      id: 'c1',
      name: 'Americano',
      description: 'Espresso com água quente',
      price: 15.000,
      imageUrl: 'https://conscienciacafe.com.br/wp-content/uploads/2023/09/cafe-espresso-maquina-1024x683.jpg',
    ),
    Coffee(
      id: 'c2',
      name: 'Cappuccino',
      description: 'Espresso com espumante',
      price: 25.000,
      imageUrl: 'https://bed-api.eraofwe.com/public/prd/file_manager/cl-articles/325_2t1sGU20211108142019209142450',
    ),
    Coffee(
      id: 'c3',
      name: 'Macchiato',
      description: 'Espresso com leite',
      price: 25.000,
      imageUrl: 'https://lorcoffee.com/cdn/shop/articles/Lor_L_People_2857773_RGB.jpg?v=1684861692',
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.shopping_cart),
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://roastercoffees.com/wp-content/uploads/2021/04/What-Is-Macchiato-1024x683.webp', // Substitua pela URL da imagem desejada
                      ),
                      fit: BoxFit.cover,
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
              )
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
