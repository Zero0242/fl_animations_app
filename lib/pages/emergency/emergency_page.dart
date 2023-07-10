import 'package:animate_do/animate_do.dart';
import 'package:animations_app/widgets/emergency/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/emergency/boton_gordo.dart';
import '../../widgets/emergency/itemboton_model.dart';

class EmergengyPage extends StatelessWidget {
  const EmergengyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const IconHeader(
            icon: FontAwesomeIcons.plus,
            title: 'Has solicitado',
            subtitle: 'Asistencia Medica',
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: itemsMap(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> itemsMap() => items
      .map(
        (boton) => FadeInLeft(
          duration: const Duration(milliseconds: 1500),
          child: BotonGordo(
            titulo: boton.title,
            colors: boton.colors,
            icon: boton.icon,
          ),
        ),
      )
      .toList();
}
