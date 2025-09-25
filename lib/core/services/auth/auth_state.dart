import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../modules/auth/repositories/auth_repository.dart';

part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  final AuthRepository _authRepository = AuthRepository();

  /// Estado inicial: consulta si hay sesión guardada
  @override
  Future<bool> build() async {
    return await _authRepository.isAuthenticated();
  }

  /// Login: recibe email y password, hace login real y actualiza el estado
  Future<bool> signIn(String email, String password) async {
    final success = await _authRepository.login(email, password);
    if (success) {
      state = AsyncData(true);
    } else {
      state = AsyncData(false);
    }
    return success;
  }

  /// Logout: limpia sesión y marca como no logueado
  Future<void> signOut() async {
    await _authRepository.logout();
    state = AsyncData(false);
  }

  /// Getter conveniente
  bool get isSignedIn {
    if (state is AsyncData<bool>) {
      return (state as AsyncData<bool>).value;
    }
    return false;
  }
}
