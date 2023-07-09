import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String title;
  final List<Color> colors;
  ItemBoton(this.icon, this.title, this.colors);
}

final items = <ItemBoton>[
  ItemBoton(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    [const Color(0xff6989F5), const Color(0xff906EF5)],
  ),
  ItemBoton(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    [const Color(0xff66A9F2), const Color(0xff536CF6)],
  ),
  ItemBoton(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    [const Color(0xffF2D572), const Color(0xffE06AA3)],
  ),
  ItemBoton(
    FontAwesomeIcons.biking,
    'Awards',
    [const Color(0xff317183), const Color(0xff46997D)],
  ),
  ItemBoton(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    [const Color(0xff6989F5), const Color(0xff906EF5)],
  ),
  ItemBoton(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    [const Color(0xff66A9F2), const Color(0xff536CF6)],
  ),
  ItemBoton(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    [const Color(0xffF2D572), const Color(0xffE06AA3)],
  ),
  ItemBoton(
    FontAwesomeIcons.biking,
    'Awards',
    [const Color(0xff317183), const Color(0xff46997D)],
  ),
  ItemBoton(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    [const Color(0xff6989F5), const Color(0xff906EF5)],
  ),
  ItemBoton(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    [const Color(0xff66A9F2), const Color(0xff536CF6)],
  ),
  ItemBoton(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    [const Color(0xffF2D572), const Color(0xffE06AA3)],
  ),
  ItemBoton(
    FontAwesomeIcons.biking,
    'Awards',
    [const Color(0xff317183), const Color(0xff46997D)],
  ),
];
