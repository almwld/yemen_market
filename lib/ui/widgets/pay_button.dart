import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  const PayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          Navigator.pushNamed(context, '/payment-info'),
      child: const Text('الدفع'),
    );
  }
}
