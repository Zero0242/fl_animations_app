import 'dart:ui';

import 'package:fl_animaciones/presentation/providers/sensors/gyroscope_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TiltImageScreen extends ConsumerWidget {
  const TiltImageScreen({super.key});
  static const String route = '/tilt-image';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscopeStream$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Imagen Efecto'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Row(),
          gyroscopeStream$.when(
            data: (data) => CustomImageContainer(
              image: const AssetImage('assets/images/dog.png'),
              height: 300,
              width: 300,
              offset: Offset(data.x, data.y),
            ),
            error: (error, stackTrace) => const Icon(Icons.error),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    this.offset = Offset.zero,
  });
  final ImageProvider image;
  final double height;
  final double width;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            offset: offset,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(image: image, fit: BoxFit.cover),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: SizedBox(height: height, width: width),
                  ),
                ),
              ],
            ),
          ),
          Image(image: image, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
