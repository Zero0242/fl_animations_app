import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:fl_animaciones/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});
  static const String route = '/mapa-flutter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(permissionsProvider).locationGranted;
    if (!isEnabled) return const LocationPermisionView();
    return Scaffold(
      appBar: AppBar(title: const Text('Map Location'), centerTitle: true),
      body: Center(
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(-34.509364, -70.128928),
            initialZoom: 9.2,
          ),
          children: <Widget>[
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.pedrocorrea.animationapp',
            ),
            UserLocationMarker(
              userMarker: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                alignment: Alignment.center,
                child: const FaIcon(
                  FontAwesomeIcons.marker,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserLocationMarker extends ConsumerWidget {
  const UserLocationMarker({super.key, required this.userMarker});
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
