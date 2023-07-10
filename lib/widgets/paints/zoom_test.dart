import 'package:flutter/material.dart';

class ZoomAnimation extends StatefulWidget {
  const ZoomAnimation({
    super.key,
    this.child = const SizedBox(),
    this.colors = const [
      Colors.deepOrange,
      Colors.orange,
      Colors.blueAccent,
      Colors.blue,
      Colors.greenAccent,
      Colors.green,
    ],
  });
  final List<Color> colors;
  final Widget child;
  // Todo: might add optional parameters to pass to the state

  @override
  State<ZoomAnimation> createState() => _ZoomAnimationState();
}

class _ZoomAnimationState extends State<ZoomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Color> lista2 = [];

  @override
  void initState() {
    lista2.addAll(widget.colors);
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..forward()
          ..repeat();
    _animation =
        Tween<double>(begin: 1 / lista2.length, end: 0.5).animate(_controller);
    super.initState();
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
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  transform: GradientRotation(_animation.value),
                  center: Alignment.center,
                  radius: _animation.value,
                  tileMode: TileMode.repeated,
                  colors: lista2,
                ),
              ),
            ),
            widget.child,
          ],
        );
      },
    );
  }
}
