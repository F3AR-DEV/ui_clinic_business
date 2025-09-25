// auth_redirect.dart
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth_state.dart';

part 'auth_redirect.g.dart';

@riverpod
String? authRedirect(Ref ref, GoRouterState state) {
  final auth = ref.watch(authStateProvider.notifier);

  final isSignedIn = auth.isSignedIn;
  final location = state.uri.toString();

  if (!isSignedIn && location != '/login') return '/login';

  if (isSignedIn && location == '/login') return '/home';

  return null;
}
