import 'dart:ui';

import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:fl_animaciones/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});
  static const String route = '/mapa-flutter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapcontroller = ref.watch(mapControllerProvider);
    final isEnabled = ref.watch(permissionsProvider).locationGranted;
    if (!isEnabled) return const LocationPermisionView();
    return Scaffold(
      appBar: AppBar(title: const Text('Map Location'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.compass_calibration),
        onPressed: () async {
          try {
            final location = await Geolocator.getCurrentPosition();
            ref
                .read(mapControllerProvider)
                .move(LatLng(location.latitude, location.longitude), 15);
          } catch (e) {
            print('Error $e');
          }
        },
      ),
      body: Center(
        child: FlutterMap(
          mapController: mapcontroller,
          options: const MapOptions(
            initialCenter: LatLng(-34.509364, -70.128928),
            initialZoom: 9.2,
          ),
          children: <Widget>[
            /// Google Maps layer
            TileLayer(
              urlTemplate: 'https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}',
              userAgentPackageName: 'com.pedrocorrea.animationapp',
            ),
            const UserLocationLayer(userMarker: UserMarker()),
          ],
        ),
      ),
    );
  }
}

class UserMarker extends StatefulWidget {
  const UserMarker({super.key});

  @override
  State<UserMarker> createState() => _UserMarkerState();
}

class _UserMarkerState extends State<UserMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const size = 100.0;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        final lerp = lerpDouble(0.5, 1, value)!;
        return Stack(
          alignment: const Alignment(0, 0),
          children: <Widget>[
            AnimatedContainer(
              duration: Durations.short1,
              height: size * lerp,
              width: size * lerp,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 50,
              width: 50,
              child: FlutterLogo(),
            ),
          ],
        );
      },
    );
  }
}

class UserLocationLayer extends ConsumerWidget {
  const UserLocationLayer({super.key, required this.userMarker});
  final Widget userMarker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchPosition$ = ref.watch(watchLocationProvider);

    return MarkerLayer(
      markers: watchPosition$.when(
        data: (data) => [
          Marker(
            point: LatLng(data.$1, data.$2),
            child: userMarker,
          ),
        ],
        error: (error, _) => [],
        loading: () => [],
      ),
    );
  }
}
