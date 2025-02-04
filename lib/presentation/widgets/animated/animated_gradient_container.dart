import 'package:flutter/material.dart';

/// Contenedor con la animación base del gradiente
class AnimatedGradientContainer extends StatefulWidget {
  const AnimatedGradientContainer({
    super.key,
    // Fondo animado
    this.repeat = false,
    // this.decorationImage,
    this.mainColor = const Color(0xff061700),
    this.secondaryColor = const Color(0xff52c234),
    this.duration = const Duration(seconds: 10),
    required this.child,
  });

  final Color mainColor;
  final Color secondaryColor;
  final Duration duration;
  final Widget child;
  final bool repeat;
  // Posible implementación de una imagen??
  // final DecorationImage? decorationImage;

  @override
  State<AnimatedGradientContainer> createState() =>
      _AnimatedGradientContainerState();
}

class _AnimatedGradientContainerState extends State<AnimatedGradientContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _fadeColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fadeColor = ColorTween(
      begin: widget.secondaryColor,
      end: widget.mainColor,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.85, 1, curve: Curves.linear),
      ),
    );
    _controller.repeat(reverse: widget.repeat);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            // image: widget.decorationImage,
            gradient: LinearGradient(
              colors: <Color>[
                widget.mainColor,
                _fadeColor.value ?? widget.secondaryColor,
                widget.mainColor,
              ],
              stops: <double>[
                0.0,
                _controller.value,
                1.0,
              ],
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
