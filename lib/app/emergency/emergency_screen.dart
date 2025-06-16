import 'package:animate_do/animate_do.dart';
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});
  static const String route = '/emergency';

  List<_ItemBoton> get _items => [
    _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', [
      const Color(0xff6989F5),
      const Color(0xff906EF5),
    ]),
    _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', [
      const Color(0xff66A9F2),
      const Color(0xff536CF6),
    ]),
    _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', [
      const Color(0xffF2D572),
      const Color(0xffE06AA3),
    ]),
    _ItemBoton(FontAwesomeIcons.personBiking, 'Awards', [
      const Color(0xff317183),
      const Color(0xff46997D),
    ]),
    _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', [
      const Color(0xff6989F5),
      const Color(0xff906EF5),
    ]),
    _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', [
      const Color(0xff66A9F2),
      const Color(0xff536CF6),
    ]),
    _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', [
      const Color(0xffF2D572),
      const Color(0xffE06AA3),
    ]),
    _ItemBoton(FontAwesomeIcons.personBiking, 'Awards', [
      const Color(0xff317183),
      const Color(0xff46997D),
    ]),
    _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', [
      const Color(0xff6989F5),
      const Color(0xff906EF5),
    ]),
    _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', [
      const Color(0xff66A9F2),
      const Color(0xff536CF6),
    ]),
    _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', [
      const Color(0xffF2D572),
      const Color(0xffE06AA3),
    ]),
    _ItemBoton(FontAwesomeIcons.personBiking, 'Awards', [
      const Color(0xff317183),
      const Color(0xff46997D),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          const IconHeader(
            icon: FontAwesomeIcons.plus,
            title: 'Has solicitado',
            subtitle: 'Asistencia Medica',
          ),
          ThickButton(
            titulo: 'Go Back',
            icon: Icons.chevron_left,
            onPress: () {
              context.pop();
            },
          ),
          for (final config in _items)
            FadeInLeft(
              duration: const Duration(milliseconds: 1500),
              child: ThickButton(
                titulo: config.title,
                colors: config.colors,
                icon: config.icon,
              ),
            ),
        ],
      ),
    );
  }
}

class _ItemBoton {
  _ItemBoton(this.icon, this.title, this.colors);
  final IconData icon;
  final String title;
  final List<Color> colors;
}
