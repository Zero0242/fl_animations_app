import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:fl_animaciones/config/config.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final audioWaveProvider = FutureProvider.autoDispose<PlayerController>((
  ref,
) async {
  final playerController = PlayerController();
  final dir = await getApplicationDocumentsDirectory();
  final temp = File('${dir.path}/temp.mp3');
  final audio = await rootBundle.load(
    'assets/music/Breaking-Benjamin-Far-Away.mp3',
  );
  await temp.writeAsBytes(audio.buffer.asUint8List());
  playerController.preparePlayer(path: temp.path);
  return ref.listenAndDisposeChangeNotifier(playerController);
});
