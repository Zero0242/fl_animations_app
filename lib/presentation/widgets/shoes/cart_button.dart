import 'package:flutter/material.dart';

import 'shoe_button.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.monto});
  final double monto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20),
          Text(
            '\$$monto',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const ShoeButton(text: 'Add to cart'),
        ],
      ),
    );
  }
}
