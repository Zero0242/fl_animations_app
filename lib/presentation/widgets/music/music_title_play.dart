import 'package:audioplayers/audioplayers.dart';
import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicTitlePlay extends ConsumerStatefulWidget {
  const MusicTitlePlay({
    super.key,
    required this.audioSource,
  });
  final Source audioSource;

  @override
  ConsumerState<MusicTitlePlay> createState() => _MusicTitlePlayState();
}

class _MusicTitlePlayState extends ConsumerState<MusicTitlePlay>
    with SingleTickerProviderStateMixin {
  // TODO: puede ser reusado
  final assetAudioPlayer = AudioPlayer();
  AnimationController? playAnimation;
  bool isPlaying = false;
  bool firstTime = true;

  @override
  void initState() {
    playAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    playAnimation?.dispose();
    assetAudioPlayer.dispose();
    super.dispose();
  }

  void open() async {
    final notifier = ref.read(audioPlayerProvider.notifier);
    await assetAudioPlayer.play(widget.audioSource);
    final duration = await assetAudioPlayer.getDuration();
    notifier.updateTotal(duration!);
    // Listeners
    assetAudioPlayer.onPositionChanged.listen((data) {
      print('Escuchando duración');
      notifier.updateDuration(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Far away',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              if (firstTime) {
                open();
                firstTime = false;
              }
              if (isPlaying) {
                playAnimation!.reverse();
                assetAudioPlayer.pause();
              } else {
                playAnimation!.forward();
                assetAudioPlayer.resume();
              }
              isPlaying = !isPlaying;
            },
            backgroundColor: const Color(0xfff8cb51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              color: Colors.white,
              progress: playAnimation!,
            ),
          ),
        ],
      ),
    );
  }
}
