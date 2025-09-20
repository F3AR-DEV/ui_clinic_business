// auth_redirect.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_state.dart';

part 'auth_redirect.g.dart';

@riverpod
String? authRedirect(Ref ref, BuildContext context, GoRouterState state) {
  final isSignedIn = ref.watch(
    authStateProvider,
  ); // 👈 observa el estado de autenticación

  // Si no está logueado y no está en /login → redirige a /login
  if (!isSignedIn && state.matchedLocation != '/login') {
    return '/login';
  }

  // Si ya está logueado y quiere ir a /login → redirige a /home
  if (isSignedIn && state.matchedLocation == '/login') {
    return '/home';
  }

  // De lo contrario → no redirige
  return null;
}
