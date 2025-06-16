import 'package:flutter/material.dart';

/// Intensidad del beat
enum BeatIntensity {
  low(0.125),
  medium(0.15),
  high(0.2),
  extreme(0.3);

  const BeatIntensity(this.intensity);

  final double intensity;
}

class HeartBeatAnimation extends StatefulWidget {
  const HeartBeatAnimation({
    super.key,
    required this.child,
    this.duration = Durations.extralong1,
    this.intensity = BeatIntensity.high,
  });
  final Widget child;
  final Duration duration;
  final BeatIntensity intensity;

  @override
  State<HeartBeatAnimation> createState() => _HeartBeatAnimationState();
}

class _HeartBeatAnimationState extends State<HeartBeatAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..forward()
          ..addStatusListener((status) {
            switch (status) {
              case AnimationStatus.completed:
                _animationController?.reverse();
                break;
              case AnimationStatus.dismissed:
                _animationController?.forward();
                break;
              default:
            }
          });
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      child: widget.child,
      builder: (context, child) {
        final ratio = _animation!.value * widget.intensity.intensity;
        return Transform.scale(
          scaleY: 1 + ratio,
          scaleX: 1 + ratio,
          child: child,
        );
      },
    );
  }
}
