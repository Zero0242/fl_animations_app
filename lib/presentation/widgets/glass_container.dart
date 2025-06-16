import 'dart:ui';

import 'package:flutter/material.dart';

/// Contenedor con efecto de glass
/// * Funciona mejor si existe algo de fondo que haga resaltar esto, algun color o imagen
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    this.margin = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
    this.color = Colors.black45,
    this.border,
    this.height,
    this.width,
    this.opacity = 0.35,
    this.glassIntensity = 5.0,
    required this.child,
  });

  /// El radio del contenedor
  final BoxBorder? border;

  /// El radio del contenedor
  final BorderRadiusGeometry borderRadius;

  /// Color principal del contenedor, excluye el gradiente
  final Color color;

  /// Elemento
  final Widget child;

  /// Opacidad del color de fondo
  final double opacity;

  /// Intensidad del filtro
  final double glassIntensity;

  /// Ancho
  final double? height;

  /// Altura
  final double? width;

  /// Margen del contenedor
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    // * La principal funcion deste cliprrect es contener el efecto del blur
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: glassIntensity,
          sigmaY: glassIntensity,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: margin,
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: border,
            color: color.withValues(alpha: opacity),
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
