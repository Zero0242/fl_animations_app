import 'package:flutter/material.dart';

class SlideShow extends StatefulWidget {
  const SlideShow({
    super.key,
    required this.children,
    this.direction = VerticalDirection.down,
  });
  final List<Widget> children;
  final VerticalDirection direction;

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  final double _dotPrimario = 15;
  final double _dotSecundario = 12;
  final Color _colorPrimario = Colors.blue;
  final Color _colorSecundario = Colors.grey;

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      verticalDirection: widget.direction,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.children.length, (index) {
              final isActive = index == current;
              final size = isActive ? _dotPrimario : _dotSecundario;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: size,
                width: size,
                decoration: BoxDecoration(
                  color: isActive ? _colorPrimario : _colorSecundario,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              current = value.toInt();
              setState(() {});
            },
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
