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
    ],
  );
});
