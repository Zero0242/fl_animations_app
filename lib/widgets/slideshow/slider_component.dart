import 'dart:math';

import 'package:flutter/material.dart';

class SliderAnimation extends StatefulWidget {
  const SliderAnimation({super.key, required this.child});
  final Widget child;

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..forward()
      ..repeat();
    _animation = Tween<double>(begin: 0.0, end: pi * 2).animate(_controller);
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
        return Transform.rotate(
          angle: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
