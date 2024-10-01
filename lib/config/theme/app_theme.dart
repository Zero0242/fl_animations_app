import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  /// Configuracion del tema
  AppTheme({required bool isDarkMode}) : _isDarkMode = isDarkMode;

  final bool _isDarkMode;
  final Color _seedColor = Colors.lightGreen;

  Brightness _getBrightness() =>
      _isDarkMode ? Brightness.dark : Brightness.light;

  /// Método para traer el tema
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _seedColor,
        brightness: _getBrightness(),
        textTheme: GoogleFonts.openSansTextTheme(
          // * Se usa este truco, para que la letra del texto
          // * Se adapte en modo oscuro y luz
          ThemeData(brightness: _getBrightness()).textTheme,
        ),
      );
}
