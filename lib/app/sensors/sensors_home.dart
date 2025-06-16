import 'package:fl_animaciones/app/screens.dart';
import 'package:fl_animaciones/presentation/widgets/home_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SensorsHome extends StatelessWidget {
  const SensorsHome({super.key});
  static const String route = '/sensors/home';

  List<_Route> get _routes => [
    _Route(
      icon: FontAwesomeIcons.compass,
      titulo: 'Brujula',
      page: CompassScreen.route,
    ),
    _Route(
      icon: FontAwesomeIcons.rotate,
      titulo: 'Giroscopio',
      page: GyroscopeScreen.route,
    ),
    _Route(
      icon: FontAwesomeIcons.carOn,
      titulo: 'Acelerometro',
      page: AccelerometerScreen.route,
    ),
    _Route(
      icon: FontAwesomeIcons.magnet,
      titulo: 'Magnetometro',
      page: MagnetometerScreen.route,
    ),
    _Route(
      icon: FontAwesomeIcons.baseball,
      titulo: 'Bolas',
      page: GyroscopeBallScreen.route,
    ),
    _Route(
      icon: FontAwesomeIcons.imagePortrait,
      titulo: 'Tilt Imagen',
      page: TiltImageScreen.route,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensores')),
      body: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          for (final route in _routes)
            HomeMenuItem(
              title: route.titulo,
              route: route.page,
              icon: route.icon,
            ),
        ],
      ),
    );
  }
}

class _Route {
  _Route({required this.icon, required this.titulo, required this.page});
  final IconData icon;
  final String titulo;
  final String page;
}
