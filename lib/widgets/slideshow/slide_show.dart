import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Posicion { arriba, abajo }

class SlideShow extends StatelessWidget {
  const SlideShow({
    super.key,
    required this.children,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.orientacion = Axis.horizontal,
    this.ubicacion = Posicion.abajo,
    this.dotPrimario = 15,
    this.dotSecundario = 12,
  });
  final List<Widget> children;
  final Axis orientacion;
  final Color activeColor;
  final Color inactiveColor;
  final double dotPrimario;
  final double dotSecundario;
  final Posicion ubicacion;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: Builder(builder: (context) {
        Provider.of<_SlideshowModel>(context).colorPrimario = activeColor;
        Provider.of<_SlideshowModel>(context).colorSecundario = inactiveColor;
        Provider.of<_SlideshowModel>(context).dotPrimario = dotPrimario;
        Provider.of<_SlideshowModel>(context).dotSecundario = dotSecundario;
        return _SlidePageWidget(
            ubicacion: ubicacion, orientacion: orientacion, children: children);
      }),
    );
  }
}

class _SlidePageWidget extends StatelessWidget {
  const _SlidePageWidget({
    required this.ubicacion,
    required this.children,
    required this.orientacion,
  });

  final Posicion ubicacion;
  final List<Widget> children;
  final Axis orientacion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (ubicacion == Posicion.arriba) _Dots(children),
        Expanded(child: _Slides(children, orientacion)),
        if (ubicacion == Posicion.abajo) _Dots(children),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots(this.children);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final proveedor = Provider.of<_SlideshowModel>(context);
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
            height: isActive(index, proveedor.currentPage)
                ? proveedor.dotPrimario
                : proveedor.dotSecundario,
            width: isActive(index, proveedor.currentPage)
                ? proveedor.dotPrimario
                : proveedor.dotSecundario,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isActive(index, proveedor.currentPage)
                  ? proveedor.colorPrimario
                  : proveedor.colorSecundario,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  bool isActive(int index, double currentPage) =>
      currentPage >= index - 0.5 && currentPage < index + 0.5;
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
        Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

class _SlideshowModel with ChangeNotifier {
  static double _currentPage = 0;
  static double _dotPrimario = 15;
  static double _dotSecundario = 12;
  static Color _colorPrimario = Colors.blue;
  static Color _colorSecundario = Colors.grey;

  double get currentPage => _currentPage;
  set currentPage(double newPage) {
    _currentPage = newPage;
    notifyListeners();
  }

  double get dotPrimario => _dotPrimario;
  set dotPrimario(double newSize) => _dotPrimario = newSize;
  double get dotSecundario => _dotSecundario;
  set dotSecundario(double newSize) => _dotSecundario = newSize;

  Color get colorPrimario => _colorPrimario;
  set colorPrimario(Color color) => _colorPrimario = color;

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color color) => _colorSecundario = color;
}
