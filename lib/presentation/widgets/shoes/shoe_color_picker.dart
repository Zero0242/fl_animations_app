import 'package:animate_do/animate_do.dart';
import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shoe_button.dart';

/// LA paleta de colores de los zapatos
class ShoeColorPicker extends StatelessWidget {
  const ShoeColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          _BotonColor(Color(0xff364d56), 1, 'assets/images/amarillo.png'),
          _BotonColor(Color(0xff2099f1), 2, 'assets/images/azul.png'),
          _BotonColor(Color(0xffffad29), 3, 'assets/images/verde.png'),
          _BotonColor(Color(0xff364d56), 4, 'assets/images/negro.png'),
          Spacer(),
          ShoeButton(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xffffc675),
          ),
        ],
      ),
    );
  }
}

class _BotonColor extends ConsumerWidget {
  const _BotonColor(this.color, this.index, this.asset);
  final Color color;
  final int index;
  final String asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      widthFactor: 0.7,
      child: FadeInLeft(
        delay: Duration(milliseconds: index * 200),
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: () {
            ref.read(shoeStoreProvider.notifier).updateImage(asset);
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
