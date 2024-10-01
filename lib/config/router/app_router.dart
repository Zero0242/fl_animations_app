library;

import '../../presentation/screens/screens.dart';
import 'package:flutter/material.dart' show WidgetBuilder;

/// Rutas de la app
class AppRouter {
  /// Pagina de inicio
  static const String root = '/';

  /// Implementacion rutas nativa
  ///
  /// Este es el listado de rutas vinculadas para navegacion
  ///
  /// ```dart
  /// // Empujar ruta al stack
  /// Navigator.of(context).pushNamed('/welcome');
  ///
  /// // Reemplazar ruta actual
  /// Navigator.of(context).pushReplacementNamed('/welcome');
  ///
  /// ```
  static final Map<String, WidgetBuilder> rutasApp = {
    '/': (context) => const HomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
  };
}
