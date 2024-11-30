import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:fl_animaciones/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String route = '/';

  List<_Route> get _pages => [
        _Route(
          icon: FontAwesomeIcons.paintRoller,
          titulo: 'Headers',
          page: HeadersHomeScreen.route,
        ),
        _Route(
          icon: FontAwesomeIcons.buffer,
          titulo: 'Animaciones',
          page: AnimationScreen.route,
        ),
        _Route(
          icon: FontAwesomeIcons.slideshare,
          titulo: 'SlideShow',
          page: SlideShowScreen.route,
        ),
        _Route(
          icon: FontAwesomeIcons.truckMedical,
          titulo: 'Emergencia',
          page: EmergencyScreen.route,
        ),
        _Route(
          icon: FontAwesomeIcons.circleNotch,
          titulo: 'Barra Progreso',
          page: CircularProgressScreen.route,
        ),
        _Route(
          icon: FontAwesomeIcons.pinterest,
          titulo: 'Pinterest Grid',
          page: PinterestScreen.route,
        ),
        _Route(
          icon: FontAwesomeIcons.photoFilm,
          titulo: 'Imagenes',
          page: ImageColorsScreen.route,
        ),
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
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en flutter'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggle();
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _pages.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final config = _pages[index];
          return ListTile(
            leading: FaIcon(config.icon),
            title: Text(config.titulo),
            trailing: const FaIcon(FontAwesomeIcons.chevronRight),
            onTap: () {
              context.push(config.page);
            },
          );
        },
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
