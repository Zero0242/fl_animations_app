import 'package:flutter/material.dart';

/// Simple animacion para hacer slide de un widget
class SlideOffset extends StatelessWidget {
  const SlideOffset({
    super.key,
    this.duration = const Duration(milliseconds: 300),
    required this.child,
    required this.begin,
    required this.end,
  });
  final Duration duration;
  final Widget child;
  final Offset begin;
  final Offset end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween<Offset>(end: end, begin: begin),
      builder: (context, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }
}
