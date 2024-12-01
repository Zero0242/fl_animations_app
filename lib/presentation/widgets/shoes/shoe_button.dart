import 'package:flutter/material.dart';

class ShoeButton extends StatelessWidget {
  const ShoeButton({
    super.key,
    required this.text,
    this.height = 50,
    this.width = 150,
    this.onTap,
    this.color = Colors.orange,
  });
  final String text;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
