import 'package:flutter/material.dart';

import 'config/config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animaciones",
      theme: AppTheme(isDarkMode: false).getTheme(),
      // routes: AppRouter.rutasApp,
      // initialRoute: AppRouter.root,
      home: const Scaffold(),
    );
  }
}
