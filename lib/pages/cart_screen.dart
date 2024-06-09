import 'package:coffeebreak/providers/cart_provider.dart';
import 'package:coffeebreak/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seu Carrinho'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .headlineSmall!
                            .color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: const Text('COMPRAR AGORA'),
                    onPressed: () {
                      if (cart.items.isEmpty) {
                        showErrorDialog(context);
                      } else {
                        showOrderConfirmationDialog(context, cart.totalAmount);
                        cart.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemWidget(
                cart.items.values.toList()[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Icon(
          Icons.error,
          color: Colors.red,
          size: 100,
        ),
        content: const Text(
          'Erro: Seu carrinho está vazio.',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void showOrderConfirmationDialog(BuildContext context, double totalAmount) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 100,
        ),
        content: Text(
          'Pagamento concluído!\nValor total: R\$ ${totalAmount.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}
