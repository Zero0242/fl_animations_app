import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioWavesScreen extends ConsumerWidget {
  const AudioWavesScreen({super.key});

  /// App Route is: `/music/audio-waves`
  static const String route = '/music/audio-waves';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final controllerAsync = ref.watch(audioWaveProvider);
    final state = controllerAsync.value?.playerState;
    if (controllerAsync.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Audio Waves'), centerTitle: true),
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Audio Waves'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card.outlined(
            child: AudioFileWaveforms(
              playerController: controllerAsync.requireValue,
              waveformType: WaveformType.long,
              animationCurve: Curves.linear,
              size: Size(size.width - 40, size.height * 0.2),
              decoration: BoxDecoration(color: Colors.orange),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  final provider = ref.read(audioWaveProvider).requireValue;
                  if (state?.isPlaying ?? false) {
                    provider.pausePlayer();
                  } else {
                    provider.startPlayer();
                  }
                },
                icon: Icon(
                  (state?.isPlaying ?? false) ? Icons.pause : Icons.play_arrow,
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(audioWaveProvider).requireValue.stopPlayer();
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
