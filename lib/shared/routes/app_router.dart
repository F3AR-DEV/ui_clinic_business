import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_clinic_business/modules/Home/routes/home_route.dart';


import '../services/auth/auth_redirect.dart';
import '../ui/layouts/app_layout.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/home',
    redirectLimit: 5,
    redirect: (context, state) =>
        ref.watch(authRedirectProvider(context, state)),
    errorBuilder: (context, state) => const Text('Error'),

    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppLayout(child: child);
        },
        routes: [...ref.watch(homeRoutesProvider)],
      ),
    ],
  );
}
