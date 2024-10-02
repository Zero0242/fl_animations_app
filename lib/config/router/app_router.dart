import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomeScreen.route,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
      ),
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
        path: PokemonDetailScreen.route,
        builder: (context, state) {
          int id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
          return PokemonDetailScreen(id: id);
        },
      ),
    ],
  );
});
