import 'package:flutter/material.dart';

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
