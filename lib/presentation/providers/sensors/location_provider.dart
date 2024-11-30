import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final userLocationProvider =
    FutureProvider.autoDispose<(double, double)>((ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) throw Future.error('Location services are disabled.');

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }
  final location = await Geolocator.getCurrentPosition();

  return (location.latitude, location.longitude);
});

final watchLocationProvider =
    StreamProvider.autoDispose<(double, double)>((ref) async* {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) throw Future.error('Location services are disabled.');

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  await for (final location in Geolocator.getPositionStream()) {
    yield (location.latitude, location.longitude);
  }
});
