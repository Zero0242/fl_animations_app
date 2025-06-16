import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/screens.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomeScreen.route,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: EmergencyScreen.route,
            builder: (context, state) => const EmergencyScreen(),
          ),
          GoRoute(
            path: DemoScreen.route,
            builder: (context, state) => const DemoScreen(),
          ),
          GoRoute(
            path: CircularProgressScreen.route,
            builder: (context, state) => const CircularProgressScreen(),
          ),
          GoRoute(
            path: SlideShowScreen.route,
            builder: (context, state) => const SlideShowScreen(),
          ),
          GoRoute(
            path: PinterestScreen.route,
            builder: (context, state) => const PinterestScreen(),
          ),
          GoRoute(
            path: HeadersHomeScreen.route,
            builder: (context, state) => const HeadersHomeScreen(),
          ),
          GoRoute(
            path: AnimationScreen.route,
            builder: (context, state) => const AnimationScreen(),
          ),
          GoRoute(
            path: ImageColorsScreen.route,
            builder: (context, state) => const ImageColorsScreen(),
          ),
          GoRoute(
            path: SensorsHome.route,
            builder: (context, state) => const SensorsHome(),
          ),
          GoRoute(
            path: CompassScreen.route,
            builder: (context, state) => const CompassScreen(),
          ),
          GoRoute(
            path: GyroscopeScreen.route,
            builder: (context, state) => const GyroscopeScreen(),
          ),
          GoRoute(
            path: TiltImageScreen.route,
            builder: (context, state) => const TiltImageScreen(),
          ),
          GoRoute(
            path: AccelerometerScreen.route,
            builder: (context, state) => const AccelerometerScreen(),
          ),
          GoRoute(
            path: MagnetometerScreen.route,
            builder: (context, state) => const MagnetometerScreen(),
          ),
          GoRoute(
            path: MapScreen.route,
            builder: (context, state) => const MapScreen(),
          ),
          GoRoute(
            path: MusicScreen.route,
            builder: (context, state) => const MusicScreen(),
          ),
          GoRoute(
            path: GyroscopeBallScreen.route,
            builder: (context, state) => const GyroscopeBallScreen(),
          ),
          GoRoute(
            path: SkeletonScreen.route,
            builder: (context, state) => const SkeletonScreen(),
          ),
          GoRoute(
            path: AudioWavesScreen.route,
            builder: (context, state) => const AudioWavesScreen(),
          ),
          GoRoute(
            path: ShoesScreen.route,
            builder: (context, state) => const ShoesScreen(),
            routes: <RouteBase>[
              GoRoute(
                path: ShoesDetailsScreen.partial,
                builder: (context, state) => const ShoesDetailsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: PokemonDetailScreen.route,
            builder: (context, state) {
              int id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
              return PokemonDetailScreen(id: id);
            },
          ),
        ],
      ),
    ],
  );
});
