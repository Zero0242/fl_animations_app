// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SkeletonScreen extends StatelessWidget {
  const SkeletonScreen({super.key});
  static const String route = '/skeleton-loader';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla de Carga')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Row(
              children: <Widget>[
                Expanded(child: SkeletonContainer(height: 200)),
                SizedBox(width: 20),
                Column(
                  children: <Widget>[
                    SkeletonContainer(height: 90, width: 150),
                    SizedBox(height: 20),
                    SkeletonContainer(height: 90, width: 150),
                  ],
                ),
              ],
            ),
            const SkeletonContainer(
              delay: Durations.long1,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 350,
              width: double.infinity,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const SkeletonContainer(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 100,
                    width: 300,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
