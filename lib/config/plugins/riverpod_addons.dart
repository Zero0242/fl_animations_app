// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'dart:async' show Timer;
import 'dart:developer' show log;

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CacheForExtension on Ref {
  /// More info on [https://riverpod.dev/docs/essentials/auto_dispose#example-keeping-state-alive-for-a-specific-amount-of-time]
  /// Keeps the provider alive for [duration].
  void cacheFor(Duration duration) {
    // Immediately prevent the state from getting destroyed.
    final link = keepAlive();
    // After duration has elapsed, we re-enable automatic disposal.
    final timer = Timer(duration, link.close);

    // Optional: when the provider is recomputed (such as with ref.watch),
    // we cancel the pending timer.
    onDispose(timer.cancel);
  }

  T listenAndDisposeChangeNotifier<T extends ChangeNotifier>(T notifier) {
    notifier.addListener(notifyListeners);
    onDispose(() => notifier.removeListener(notifyListeners));
    onDispose(notifier.dispose);
    return notifier;
  }
}

/// A custom [ProviderObserver] implementation for debugging purposes.
///
/// This observer logs provider lifecycle events such as initialization,
/// updates, disposal, and errors. It integrates with Riverpod to help
/// developers monitor and debug provider behavior in their application.
class DebugObserver extends ProviderObserver {
  const DebugObserver();

  String _format(ProviderBase<Object?> provider) {
    final name = provider.name ?? '';
    if (name.isEmpty) return '';
    return '( ${name[0].toUpperCase()}${name.substring(1)} )';
  }

  String _parseValue(Object? value) {
    final formattedValue = value is List
        ? '${value.length} elements'
        : value.toString();
    return formattedValue;
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final providerName = _format(provider);

    log(
      '$providerName\n> was initialized with ${_parseValue(value)}',
      name: 'Riverpod',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final providerName = _format(provider);

    log('$providerName was disposed!!', name: 'Riverpod');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final providerName = _format(provider);

    log(
      '$providerName updated!! \n> from ${_parseValue(previousValue)} \n> to ${_parseValue(newValue)}',
      name: 'Riverpod',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final providerName = _format(provider);
    final formattedStackTrace = stackTrace
        .toString()
        .split('\n')
        .take(5)
        .join('\n');

    log(
      name: 'Riverpod',
      '$providerName\n> threw $error at:\n$formattedStackTrace',
    );
  }
}
