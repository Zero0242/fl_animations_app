import 'package:audioplayers/audioplayers.dart';
import 'package:fl_animaciones/core/models/models.dart';
import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _musicDemo = MusicConfiguration(
  asset: AssetSource('music/Breaking-Benjamin-Far-Away.mp3'),
  albumCover: 'assets/music/aurora.jpg',
  lyrics: [
    'Hope stopped the heart',
    'Lost beaten lie',
    'Cold walk the earth',
    'Love faded white',
    'Gave up the war',
    'I\'ve realized',
    'All will become',
    'All will arise',
    'Stay with me',
    'I hear them call the tide',
    'Take me in',
    'I see the last divide',
    'Hopelessy',
    'I leave this all behind',
    'And I am paralyzed',
    'When the broken fall alive',
    'Let the light take me too',
    'When the waters turn to fire',
    'Heaven, please let me through',
    'Far away, far away',
    'Sorrow has left me here',
    'Far away, far away',
    'Let the light take me in',
    'Fight back the flood',
    'One breath of life',
    'God, take the earth',
    'Forever blind',
    'And now the sun will fade',
    'And all we are is all we made',
    'Stay with me',
    'I hear them call the tide',
    'Take me in',
    'I see the last divide',
    'Hopelessy',
    'I leave this all behind',
    'And I am paralyzed',
    'When the broken fall alive',
    'Let the light take me too',
    'When the waters…',
  ],
);

class MusicScreen extends ConsumerWidget {
  const MusicScreen({super.key});
  static const String route = '/music-app';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayer = ref.watch(audioPlayerProvider);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const _Background(),
          Column(
            children: <Widget>[
              const MusicAppBar(),
              const SizedBox(height: 70),
              // * Disco
              Row(
                children: <Widget>[
                  MusicDisc(
                    discImage: _musicDemo.albumCover,
                    getController:
                        ref.read(audioPlayerProvider.notifier).setController,
                  ),
                  const SizedBox(width: 20),
                  MusicProgress(
                    current: audioPlayer.songProgress,
                    totalDuration: audioPlayer.songTotalDuration,
                    progress: audioPlayer.porcentaje,
                  ),
                ],
              ),
              // * Title
              MusicTitlePlay(audioSource: _musicDemo.asset),
              // * Lyrics
              Expanded(
                child: MusicLyrics(lyrics: _musicDemo.lyrics),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: <Color>[
            Color(0xff33333e),
            Color(0xff201e28),
          ],
        ),
      ),
    );
  }
}
