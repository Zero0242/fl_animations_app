import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, this.borderRadius, this.angulo = 0});
  const HeaderWidget.diagonal({super.key, this.borderRadius}) : angulo = -0.09;
  const HeaderWidget.redondeado({super.key, this.angulo = 0})
      : borderRadius = const BorderRadius.only(bottomLeft: Radius.circular(50));

  final BorderRadius? borderRadius;
  final double angulo;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angulo,
      child: Container(
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          color: const Color(0xff615AAB),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
