import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Stack(
      children: [
        const _IconBackground(),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text(
              'Has solicitado',
              style:
                  TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)),
            ),
            const SizedBox(height: 20),
            Text(
              'Asistencia Medica',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.plus,
              size: 80,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _IconBackground extends StatelessWidget {
  const _IconBackground();

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
