import 'package:animations_app/pages/animation_page.dart';
import 'package:animations_app/pages/emergency/emergency_page.dart';
import 'package:animations_app/pages/home_page.dart';
import 'package:animations_app/pages/pinterest/pinterest_page.dart';
import 'package:animations_app/pages/progress/graficas_circulaes.dart';
import 'package:animations_app/pages/slideshow/slideshow_page.dart';
import 'package:animations_app/pages/sliver/sliverdemo_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route({required this.icon, required this.titulo, required this.page});
}

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    titulo: 'SlideShow',
    page: const SlideShowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.truckMedical,
    titulo: 'Emergencia',
    page: const EmergengyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    titulo: 'Encabezados',
    page: const EncabezadosPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    titulo: 'Cuadro Animado',
    page: const AnimationDemoPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    titulo: 'Barra Progreso',
    page: const GraficasCirculasPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    titulo: 'Pinterest',
    page: const PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    titulo: 'Slivers',
    page: const SliverDemoPage(),
  ),
];
