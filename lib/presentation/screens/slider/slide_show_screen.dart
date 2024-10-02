import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({super.key});
  static const String route = '/slide-show';

  @override
  Widget build(BuildContext context) {
    final isLarge = MediaQuery.of(context).size.height > 500;
    return Scaffold(
      appBar: AppBar(title: const Text('Slides'), centerTitle: true),
      body: Flex(
        direction: isLarge ? Axis.vertical : Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: SlideShow(
              children: <Widget>[
                _Slide('assets/svg/slide-1.svg'),
                _Slide('assets/svg/slide-2.svg'),
                _Slide('assets/svg/slide-3.svg'),
                _Slide('assets/svg/slide-4.svg'),
                _Slide('assets/svg/slide-5.svg'),
              ],
            ),
          ),
          Expanded(
            child: SlideShowRef(
              direction: VerticalDirection.up,
              children: <Widget>[
                _Slide('assets/svg/slide-1.svg'),
                _Slide('assets/svg/slide-2.svg'),
                _Slide('assets/svg/slide-3.svg'),
                _Slide('assets/svg/slide-4.svg'),
                _Slide('assets/svg/slide-5.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Slide(String svg) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
