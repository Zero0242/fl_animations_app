import 'package:flutter/material.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SlideShow')),
      body: const Center(
        child: Text('Slideshow page'),
      ),
    );
  }
}
