import 'package:animate_do/animate_do.dart';
import 'package:animations_app/pages/do_page/navegacion_page.dart';
import 'package:animations_app/pages/do_page/twitter_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicsAnimationPage extends StatelessWidget {
  const BasicsAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(child: const Text('Animated page')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TwitterPage(),
              ));
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
        ],
      ),
      floatingActionButton: BounceInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const NavegacionPage(),
              ),
            );
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
                delay: const Duration(milliseconds: 1100),
                child: const Icon(Icons.new_releases,
                    color: Colors.blue, size: 40)),
            FadeInDown(
              delay: const Duration(milliseconds: 350),
              child: const Text(
                'Titulo',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDownBig(
              delay: const Duration(milliseconds: 700),
              child: const Text(
                'Mini text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 800),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
