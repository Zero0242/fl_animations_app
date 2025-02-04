import 'package:flutter/material.dart';

class HeartBeatImage extends StatefulWidget {
  const HeartBeatImage({
    super.key,
    required this.asset,
    this.height,
    this.duration = Durations.extralong1,
  });
  final String asset;
  final double? height;
  final Duration duration;

  @override
  State<HeartBeatImage> createState() => _HeartBeatImageState();
}

class _HeartBeatImageState extends State<HeartBeatImage>
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
    _animation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController!);
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
      child: Image.asset(widget.asset, height: widget.height),
      builder: (context, child) {
        final ratio = _animation!.value * 0.5;
        return Transform.scale(
          scaleY: 1 + ratio,
          scaleX: 1 + ratio,
          child: child,
        );
      },
    );
  }
}
