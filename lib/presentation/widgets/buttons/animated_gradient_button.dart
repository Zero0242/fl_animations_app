import 'package:flutter/material.dart';

/// Boton con una animación de fondo en el gradiente
/// * Usa solo 2 colores en el gradiente
class AnimatedGradientButton extends StatefulWidget {
  const AnimatedGradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 18,
    this.backgroundColor,
    this.animatedColor,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? animatedColor;

  @override
  State<AnimatedGradientButton> createState() => _AnimatedGradientButtonState();
}

class _AnimatedGradientButtonState extends State<AnimatedGradientButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller?.repeat(min: 0, max: 1, reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final primaryColor = widget.backgroundColor ?? theme.primary;
    final secondaryColor = widget.animatedColor ?? Colors.white;
    return InkWell(
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _controller!,
        builder: (context, child) {
          return Container(
            constraints: const BoxConstraints(minHeight: kToolbarHeight * 0.8),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              gradient: LinearGradient(
                colors: <Color>[primaryColor, secondaryColor, primaryColor],
                stops: <double>[0.0, _controller!.value, 1.0],
              ),
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
