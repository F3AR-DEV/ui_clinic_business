import '../../../core/storage/auth_storage.dart';
import '../models/auth_dto.dart';
import '../services/auth_services.dart';

class AuthRepository {
  final AuthApiService _apiService = AuthApiService();
  final AuthStorage _authStorage = AuthStorage();

  // Login
  Future<bool> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);
      final LoginResponse? response = await _apiService.login(request);

      if (response != null) {
        await _authStorage.saveTokens(response.jwt, response.refreshToken);
        _authStorage.saveUser(response.user.toJson());
        _authStorage.saveLoggedIn(true);
        return true;
      }
      return false;
    } catch (e) {
      print('Error en la autenticación: $e');
      return false;
    }
  }

  // ✅ Logout
  Future<void> logout() async {
    await _authStorage.clearAll();
  }

  // ✅ Consultar si el usuario está autenticado
  Future<bool> isAuthenticated() async {
    return _authStorage.isLoggedIn;
  }
}
