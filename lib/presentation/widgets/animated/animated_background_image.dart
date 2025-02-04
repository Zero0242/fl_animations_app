import 'package:flutter/material.dart';

/// Toma todo el espacio que tiene disponible
class BackgroundAnimatedImage extends StatefulWidget {
  const BackgroundAnimatedImage({
    super.key,
    required this.image,
    this.frontImage,
    this.movementDistance = -50,
  });

  /// Imagen de fondo
  final ImageProvider image;

  /// Imagen del foreground
  final ImageProvider? frontImage;

  /// Movimiento horizontal
  final double movementDistance;

  @override
  State<BackgroundAnimatedImage> createState() =>
      _BackgroundAnimatedImageState();
}

class _BackgroundAnimatedImageState extends State<BackgroundAnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _controller.repeat(reverse: true);
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
      builder: (context, _) {
        return Stack(
          fit: StackFit.expand,
          // Para evitar recortar
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned.fill(
              left: widget.movementDistance * _controller.value,
              right: widget.movementDistance * (1 - _controller.value),
              child: Image(image: widget.image, fit: BoxFit.cover),
            ),
            if (widget.frontImage != null)
              Positioned.fill(
                left: widget.movementDistance * _controller.value,
                right: widget.movementDistance * (1 - _controller.value),
                child: Image(image: widget.frontImage!, fit: BoxFit.cover),
              ),
          ],
        );
      },
    );
  }
}
