import 'package:ecom/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'app_routes_name.dart';

class AppRoutes {
  const AppRoutes._();

  // ─── Navigator Keys ──────────────────────────────────────────────
  // Root navigator for the entire app
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutesName.home,
    routes: [
      // ─── Authentication ────────────────────────────────────────
      // GoRoute(
      //   path: AppRoutesName.signIn,
      //   name: AppRoutesName.signIn,
      //   builder: (context, state) => const LoginScreen(),
      // ),

      GoRoute(
        path: AppRoutesName.home,
        name: AppRoutesName.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}