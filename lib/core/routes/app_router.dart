import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ui_clinic_business/modules/Home/routes/home_route.dart';

import '../../modules/modules.dart' as auth_routes;
import '../../shared/ui/layouts/app_layout.dart';
import '../services/auth/auth_redirect.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    redirectLimit: 5,

    redirect: (context, state) {
      return ref.watch(authRedirectProvider(state));
    },

    errorBuilder: (context, state) => const Text('Error'),

    routes: [
      // Rutas de autenticación (login, register...)
      ...auth_routes.authRoutes(),

      // Rutas protegidas dentro del ShellRoute
      ShellRoute(
        builder: (context, state, child) => AppLayout(child: child),
        routes: [...ref.watch(homeRoutesProvider)],
      ),
    ],
  );
}
