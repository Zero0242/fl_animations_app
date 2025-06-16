import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  const IconHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.colors = const [Color(0xff526bf6), Color(0xff67acf2)],
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconBackground(colors),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
            FaIcon(icon, size: 80, color: Colors.white),
          ],
        ),
        Positioned(
          right: 0,
          top: 40,
          child: RawMaterialButton(
            padding: const EdgeInsets.all(12),
            shape: const CircleBorder(),
            onPressed: () {},
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _IconBackground extends StatelessWidget {
  const _IconBackground(this.colors);
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}
