import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications Demo'),
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
        body: const Center(child: FlutterLogo()),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final provider =
            Provider.of<_NotificationModel>(context, listen: false);
        provider.numero++;
        if (provider.numero >= 2) {
          final controller = provider.bounceController;
          controller.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bones',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                child: BounceInDown(
                  from: 10,
                  animate: numero > 0 ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (p0) => Provider.of<_NotificationModel>(context)
                        .bounceController = p0,
                    child: Container(
                      width: 12,
                      height: 12,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.redAccent),
                      child: Text(
                        '$numero',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          label: 'Notifications',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          label: 'My Dog',
        ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;

  AnimationController? _bounceController;

  int get numero => _numero;
  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController!;
  set bounceController(AnimationController controller) =>
      _bounceController = controller;
}
