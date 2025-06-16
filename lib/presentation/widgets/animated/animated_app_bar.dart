// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_gradient_container.dart';

/// Appbar personalizado con un custom paint para pantallas de la app
/// * Por defecto va a intentar siempre dejar centrado el titulo
class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedAppBar({
    super.key,
    this.leading,
    this.title,
    this.bottom,
    this.actions,
    this.style,
    this.foregroundColor = Colors.white,
    this.mainColor = const Color(0xff200122),
    this.secondaryColor = const Color(0xff6f0000),
    this.duration = const Duration(seconds: 6),
  });
  // Appbar
  final Widget? leading;
  final Widget? title;
  final Widget? bottom;
  final List<Widget>? actions;
  final Color foregroundColor;
  final TextStyle? style;
  // Fondo animado
  final Color mainColor;
  final Color secondaryColor;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    // Previene estorbo con el safearea superiror
    final topPadding = MediaQuery.of(context).padding.top;

    return CustomTheme(
      context: context,
      child: AnimatedGradientContainer(
        mainColor: mainColor,
        secondaryColor: secondaryColor,
        duration: duration,
        repeat: true,
        child: Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ?leading,
                  ?title,
                  if (actions != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions!,
                    )
                  else
                    fakeButtonSpace(),
                ],
              ),
              ?bottom,
            ],
          ),
        ),
      ),
    );
  }

  // HACK: para tomar el espacio y el titulo sea simetrico
  // El valor por default del espacio tomado por el backbutton es 48
  Widget fakeButtonSpace() {
    return const SizedBox.square(dimension: 48);
  }

  /// Para sobre escribir el tema del custom appbar
  // ignore: non_constant_identifier_names
  Widget CustomTheme({required BuildContext context, required Widget child}) {
    final themeRef = Theme.of(context);

    return Theme(
      data: themeRef.copyWith(iconTheme: IconThemeData(color: foregroundColor)),
      child: DefaultTextStyle(
        style:
            style ??
            GoogleFonts.montserratAlternates(
              color: foregroundColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
        child: child,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight * 2);
}
