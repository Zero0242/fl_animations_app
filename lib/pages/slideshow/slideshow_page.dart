import 'package:animations_app/widgets/slideshow/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider pages')),
      body: const Column(
        children: [
          Expanded(
            child: SlideShow(
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.green,
              ubicacion: Posicion.arriba,
              children: [
                _Slide('assets/svgs/slide-1.svg'),
                _Slide('assets/svgs/slide-2.svg'),
                _Slide('assets/svgs/slide-3.svg'),
                _Slide('assets/svgs/slide-4.svg'),
                _Slide('assets/svgs/slide-5.svg'),
              ],
            ),
          ),
          Expanded(
            child: SlideShow(
              activeColor: Colors.orange,
              dotPrimario: 20,
              inactiveColor: Colors.white,
              children: [
                _Slide('assets/svgs/slide-1.svg'),
                _Slide('assets/svgs/slide-2.svg'),
                _Slide('assets/svgs/slide-3.svg'),
                _Slide('assets/svgs/slide-4.svg'),
                _Slide('assets/svgs/slide-5.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.svg);

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
