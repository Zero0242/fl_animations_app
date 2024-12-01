import 'package:audioplayers/audioplayers.dart';

class MusicConfiguration {
  MusicConfiguration({
    required this.asset,
    required this.albumCover,
    required this.lyrics,
  });

  final Source asset;
  final String albumCover;
  final List<String> lyrics;
}
