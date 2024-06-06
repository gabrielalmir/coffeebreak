import 'package:coffeebreak/pages/cart_screen.dart';
import 'package:coffeebreak/pages/coffee_detail_screen.dart';
import 'package:coffeebreak/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/cart_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CoffeeBreak',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          fontFamily: 'Lato',
        ),
        home: HomeScreen(),
        routes: {
          '/coffee-detail': (ctx) => CoffeeDetailScreen(),
          '/cart': (ctx) => CartScreen(),
        },
      ),
    );
  }
}
