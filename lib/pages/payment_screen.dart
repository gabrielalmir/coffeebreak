import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/error_dialog.dart';
import '../widgets/order_confirmation_dialog.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';

  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();

  void _confirmPayment() {
    if (_nameController.text.isEmpty || _cpfController.text.isEmpty) {
      showErrorDialog(context, 'Por favor, preencha todos os campos.');
    } else {
      final cart = Provider.of<CartProvider>(context, listen: false);
      showOrderConfirmationDialog(context, cart.totalAmount);
      cart.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Itens no Carrinho:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...cart.items.values.map((cartItem) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(cartItem.imageUrl),
                ),
                title: Text(cartItem.name),
                subtitle: Text('Quantidade: ${cartItem.quantity}'),
                trailing: Text('R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
              );
            }),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(labelText: 'CPF'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _confirmPayment,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green, // Cor do texto
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Peso da fonte
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min, // Adiciona isso para ajustar o tamanho da row ao conteúdo
                  children: [
                    Icon(Icons.shopping_cart), // Ícone de comprar
                    SizedBox(width: 8), // Espaço entre o ícone e o texto
                    Text('Confirmar Pagamento'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
