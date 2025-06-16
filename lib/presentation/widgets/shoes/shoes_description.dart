import 'package:flutter/material.dart';

class ShoesDescription extends StatelessWidget {
  const ShoesDescription({
    super.key,
    required this.titulo,
    required this.descripcion,
  });
  final String titulo;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            titulo,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(descripcion, style: const TextStyle(height: 1.6)),
        ],
      ),
    );
  }
}
