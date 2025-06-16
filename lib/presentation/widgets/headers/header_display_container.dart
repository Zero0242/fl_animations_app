import 'package:flutter/material.dart';

class HeaderDisplayContainer extends StatelessWidget {
  const HeaderDisplayContainer({
    super.key,
    required this.title,
    this.customPainter,
    this.margin = const EdgeInsets.symmetric(horizontal: 15),
  });
  final String title;
  final CustomPainter? customPainter;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Container(
          height: 400,
          margin: margin,
          width: double.infinity,
          decoration: BoxDecoration(
            color: customPainter != null ? null : Colors.orange,
            border: Border.all(color: Colors.grey),
          ),
          child: CustomPaint(painter: customPainter),
        ),
        const Divider(),
      ],
    );
  }
}
