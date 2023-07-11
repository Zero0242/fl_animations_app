import 'package:animations_app/widgets/slideshow/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../theme/theme_changer.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    final isLarge = MediaQuery.of(context).size.height > 500;
    final children = [
      Expanded(
        child: SlideShow(
          activeColor:
              (appTheme.darkTheme) ? accentColor : const Color(0xffff5a7e),
          inactiveColor: Colors.green,
          ubicacion: Posicion.arriba,
          children: const [
            _Slide('assets/svgs/slide-1.svg'),
            _Slide('assets/svgs/slide-2.svg'),
            _Slide('assets/svgs/slide-3.svg'),
            _Slide('assets/svgs/slide-4.svg'),
            _Slide('assets/svgs/slide-5.svg'),
          ],
        ),
      ),
      const Expanded(
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
    ];

    return Scaffold(
      body: (isLarge) ? Column(children: children) : Row(children: children),
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
