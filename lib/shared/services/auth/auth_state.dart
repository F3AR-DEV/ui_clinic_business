import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() {
    // Estado inicial: no logueado
    return true;
  }

  void signIn() => state = true;
  void signOut() => state = false;

  bool get isSignedIn => state;
}
