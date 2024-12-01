// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioPlayerProvider =
    StateNotifierProvider.autoDispose<AudioPlayerNotifier, AudioPlayerState>(
        (ref) {
  return AudioPlayerNotifier();
});

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  AudioPlayerNotifier() : super(AudioPlayerState());

  void setController(AnimationController controller) {
    WidgetsBinding.instance.addPostFrameCallback((s) {
      state = state.copyWith(controller: controller);
    });
  }

  void updateTotal(Duration total) {
    state = state.copyWith(songDuration: total);
  }

  void updateDuration(Duration current) {
    state = state.copyWith(current: current);
  }
}

class AudioPlayerState {
  AudioPlayerState({
    this.isPlaying = false,
    this.songDuration = const Duration(),
    this.current = const Duration(),
    this.controller,
  });

  final bool isPlaying;
  final Duration songDuration;
  final Duration current;
  final AnimationController? controller;

  double get porcentaje {
    if (songDuration.inSeconds > 0) {
      return current.inSeconds / songDuration.inSeconds;
    }
    return 0.0;
  }

  String get songTotalDuration => printDuration(songDuration);
  String get songProgress => printDuration(current);

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      return n.toString().padLeft(2, '0');
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSecond = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitMinutes:$twoDigitSecond';
  }

  AudioPlayerState copyWith({
    bool? isPlaying,
    Duration? songDuration,
    Duration? current,
    AnimationController? controller,
  }) {
    return AudioPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      songDuration: songDuration ?? this.songDuration,
      current: current ?? this.current,
      controller: controller ?? this.controller,
    );
  }
}
