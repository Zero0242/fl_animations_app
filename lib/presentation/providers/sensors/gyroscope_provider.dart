import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart' as sensors;

final gyroscopeProvider =
    StreamProvider.autoDispose<GyroscopetXYZ>((ref) async* {
  await for (final event in sensors.gyroscopeEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));
    yield GyroscopetXYZ(x, y, z);
  }
});

class GyroscopetXYZ {
  GyroscopetXYZ(this.x, this.y, this.z);
  final double x;
  final double y;
  final double z;
}
