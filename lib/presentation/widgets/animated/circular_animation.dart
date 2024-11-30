import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircularAnimation extends StatefulWidget {
  const CircularAnimation({super.key, this.delay = Duration.zero});
  final Duration delay;

  @override
  State<CircularAnimation> createState() => _CircularAnimationState();
}

class _CircularAnimationState extends State<CircularAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  Animation<double>? _movementVertical;
  Animation<double>? _movementHorizontal;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.0, end: math.pi * 2).animate(
      _controller!,
    );
    // _movementVertical = Tween<double>(begin: -1, end: 1).animate(
    //   CurvedAnimation(
    //     parent: _controller!,
    //     curve: const Interval(0, 0.25),
    //   ),
    // );
    // _movementHorizontal = Tween<double>(begin: -1, end: 1).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.25, 0.5),
    //   ),
    // );

    Future.delayed(widget.delay, () {
      _controller!.forward();
      _controller!.repeat();
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, Widget? child) {
        return Transform.translate(
          offset: Offset.zero,
          // offset: Offset(
          //   300 * (_movementHorizontal?.value ?? 1.0),
          //   1 * (_movementVertical?.value ?? 1.0),
          // ),
          child: Transform.rotate(angle: _animation?.value ?? 0, child: child),
        );
      },
      child: Container(
        height: kToolbarHeight,
        width: kToolbarHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red, width: 1),
          gradient: const RadialGradient(
            center: Alignment.topCenter,
            radius: 0.7,
            stops: [0.3, 1],
            colors: [
              Colors.yellow,
              Colors.orange,
            ],
          ),
        ),
      ),
    );
  }
}
