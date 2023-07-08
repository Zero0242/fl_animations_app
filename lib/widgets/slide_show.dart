import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slider_model.dart';

enum Posicion { arriba, abajo }

class SlideShow extends StatelessWidget {
  const SlideShow({
    super.key,
    required this.children,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.orientacion = Axis.horizontal,
    this.ubicacion = Posicion.abajo,
  });
  final List<Widget> children;
  final Axis orientacion;
  final Color activeColor;
  final Color inactiveColor;
  final Posicion ubicacion;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Column(
        children: [
          if (ubicacion == Posicion.arriba)
            _Dots(children, activeColor, inactiveColor),
          Expanded(child: _Slides(children, orientacion)),
          if (ubicacion == Posicion.abajo)
            _Dots(children, activeColor, inactiveColor),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots(this.children, this.activeColor, this.inactiveColor);
  final List<Widget> children;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).currentPage;
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          children.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            height: 12,
            width: 12,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: (pageIndex >= index - 0.5 && pageIndex < index + 0.5)
                  ? activeColor
                  : inactiveColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides(this.children, this.orientacion);
  final List<Widget> children;
  final Axis orientacion;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() =>
        Provider.of<SliderModel>(context, listen: false).currentPage =
            pageViewController.page!);
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: widget.orientacion,
      controller: pageViewController,
      children: widget.children,
    );
  }
}
