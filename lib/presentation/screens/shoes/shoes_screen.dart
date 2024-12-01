import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({super.key});
  static const String route = '/shoes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const ShoeAppBar(text: 'For You!'),
          Expanded(
            child: ListView(
              children: const <Widget>[
                ShoePreview(),
                ShoesDescription(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          ),
          const CartButton(monto: 750),
        ],
      ),
    );
  }
}
