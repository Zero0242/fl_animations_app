import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});
  static const String route = '/animation-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones')),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularAnimation(),
            CircularAnimation(delay: Duration(milliseconds: 500)),
            ShakeTransition(
              offset: -1000,
              axis: Axis.vertical,
              child: CircularAnimation(delay: Duration(milliseconds: 1000)),
            ),
            ShakeTransition(
              offset: 1000,
              child: CircularAnimation(delay: Duration(milliseconds: 1500)),
            ),
            SizedBox(height: 10),
            Text('Animated Image'),
            Expanded(
              child: BackgroundAnimatedImage(
                image: CachedNetworkImageProvider('https://picsum.photos/201'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
