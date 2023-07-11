import 'package:animations_app/launchers/launcher_page%20tablet.dart';
import 'package:animations_app/launchers/launcher_page.dart';
import 'package:animations_app/models/layout_model.dart';
import 'package:animations_app/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
        ChangeNotifierProvider(create: (_) => LayoutModel()),
      ],
      child: const AppState(),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations Playground App',
      //theme: ThemeData.dark(useMaterial3: true).copyWith(appBarTheme: const AppBarTheme(centerTitle: true)),
      theme: theme.currentTheme,
      themeAnimationCurve: Curves.bounceOut,
      themeAnimationDuration: const Duration(milliseconds: 600),
      home: OrientationBuilder(builder: (context, orientation) {
        final screenSize = MediaQuery.of(context).size;
        if (screenSize.width > 500) {
          return const LauncherTabletPage();
        } else {
          return const LauncherPage();
        }
      }),
    );
  }
}
