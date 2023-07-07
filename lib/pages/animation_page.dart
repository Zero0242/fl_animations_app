import 'package:flutter/material.dart';
import 'dart:math';

class AnimationDemoPage extends StatelessWidget {
  const AnimationDemoPage({super.key});
  static const String routes = '/animation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation Page'),
        ),
        body: const Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.square(
              dimension: kBottomNavigationBarHeight,
              child: CircularAnimation(),
            ),
          ],
        ));
  }
}

class CircularAnimation extends StatefulWidget {
  const CircularAnimation({super.key, this.delay});
  final Duration? delay;
  // Todo: might add optional parameters to pass to the state

  @override
  State<CircularAnimation> createState() => _CircularAnimationState();
}

class _CircularAnimationState extends State<CircularAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _movementVertical;
  late Animation<double> _movementHorizontal;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..forward()
      ..repeat();
    /* ..addListener(() {
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (_controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      }) */

    _animation = Tween<double>(begin: 0.0, end: pi * 2).animate(_controller);
    _movementVertical = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.25),
      ),
    );
    _movementHorizontal = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.5),
      ),
    );
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
        return Transform.translate(
          offset: Offset(
            300 * _movementHorizontal.value,
            300 * _movementVertical.value,
          ),
          child: Transform.rotate(angle: _animation.value, child: child),
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
