import 'package:flutter/material.dart';

class EmergengyPage extends StatelessWidget {
  const EmergengyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IconHeader(),
    );
  }
}

class IconHeader extends StatelessWidget {
  const IconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff526bf6),
            Color(0xff67acf2),
          ],
        ),
      ),
    );
  }
}
