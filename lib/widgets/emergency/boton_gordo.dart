import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  const BotonGordo({
    super.key,
    this.icon = FontAwesomeIcons.circle,
    required this.titulo,
    this.colors = const [Color(0xff6989f5), Color(0xff906ef5)],
    this.onPress,
  });

  final IconData icon;
  final String titulo;
  final List<Color> colors;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(icon, colors),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40),
              FaIcon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  titulo,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40)
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground(this.icon, this.colors);
  final IconData icon;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: colors),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
