import 'package:flutter/material.dart';

class MusicProgress extends StatelessWidget {
  const MusicProgress({
    super.key,
    required this.totalDuration,
    required this.progress,
    required this.current,
  });
  final String totalDuration;
  final double progress;
  final String current;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.white.withOpacity(0.4));

    return Column(
      children: <Widget>[
        Text(totalDuration, style: style),
        Stack(
          children: <Widget>[
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 230 * progress,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        Text(current, style: style),
      ],
    );
  }
}
