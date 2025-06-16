// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// Contenedor esqueleto para simular una carga
class SkeletonContainer extends StatefulWidget {
  const SkeletonContainer({
    super.key,
    this.duration = const Duration(seconds: 2),
    this.delay = Duration.zero,
    this.height = 30,
    this.width = 30,
    this.margin,
    this.backgroundColor = const Color(0xFF616161),
    this.shimmerColor = const Color(0xff9bc5c3),
  });
  final Duration duration;
  final Duration delay;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Color shimmerColor;

  @override
  State<SkeletonContainer> createState() => _SkeletonContainerState();
}

class _SkeletonContainerState extends State<SkeletonContainer>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0, 0.75, curve: Curves.linear),
      ),
    );
    Future.delayed(widget.delay, _controller?.repeat);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Container(
          margin: widget.margin,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
              colors: <Color>[
                widget.backgroundColor,
                widget.shimmerColor,
                widget.backgroundColor,
              ],
              stops: <double>[0.0, _animation!.value, 1.0],
            ),
          ),
        );
      },
    );
  }
}
