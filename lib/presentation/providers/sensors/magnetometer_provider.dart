import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart' as sensors;

final magnetometerProvider =
    StreamProvider.autoDispose<MagnetometerXYZ>((ref) async* {
  await for (final event in sensors.magnetometerEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));
    yield MagnetometerXYZ(x, y, z);
  }
});

class MagnetometerXYZ {
  MagnetometerXYZ(this.x, this.y, this.z);
  final double x;
  final double y;
  final double z;

  String get describe {
    return "X: $x, Y: $y, Z: $z";
  }
}
