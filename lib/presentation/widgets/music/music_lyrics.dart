import 'package:flutter/material.dart';

class MusicLyrics extends StatelessWidget {
  const MusicLyrics({super.key, required this.lyrics});
  final List<String> lyrics;

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      physics: const BouncingScrollPhysics(),
      itemExtent: 42,
      children: lyrics
          .map(
            (letra) => Text(
              letra,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          )
          .toList(),
    );
  }
}
