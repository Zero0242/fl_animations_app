import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AudioWavesScreen extends StatefulWidget {
  const AudioWavesScreen({super.key});

  /// App Route is: `/music/audio-waves`
  static const String route = '/music/audio-waves';

  @override
  State<AudioWavesScreen> createState() => _AudioWavesScreenState();
}

class _AudioWavesScreenState extends State<AudioWavesScreen> {
  final PlayerController playerController = PlayerController();

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  void loadFile() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final file = File('${appDirectory.path}/audio.mp3');
    final audioFile =
        await rootBundle.load('assets/music/Breaking-Benjamin-Far-Away.mp3');
    await file.writeAsBytes(audioFile.buffer.asUint8List());
    playerController.preparePlayer(path: file.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Audio Waves'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AudioFileWaveforms(
            playerController: playerController,
            waveformType: WaveformType.fitWidth,
            animationCurve: Curves.linear,
            size: Size(size.width - 40, size.height * 0.2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  playerController.startPlayer();
                },
                icon: Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: () {
                  playerController.pausePlayer();
                },
                icon: Icon(Icons.pause),
              ),
              IconButton(
                onPressed: () {
                  playerController.stopPlayer();
                },
                icon: Icon(Icons.stop),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
