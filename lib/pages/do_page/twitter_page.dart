import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool iniciar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1da1f2),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => setState(() => iniciar = !iniciar),
        backgroundColor: Colors.pinkAccent,
        child: const FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
          animate: iniciar,
          duration: const Duration(milliseconds: 2000),
          from: 30,
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
