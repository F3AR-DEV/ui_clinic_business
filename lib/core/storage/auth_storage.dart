// lib/modules/auth/services/auth_storage.dart
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final _secureStorage = const FlutterSecureStorage(
    webOptions: WebOptions(
      wrapKey: 'mi_clave_especifica', // clave de aplicación
      wrapKeyIv: 'mi_iv_especifico', // IV opcional
    ),
  );
  final _box = GetStorage();

  // Guardar tokens de manera segura
  Future<void> saveTokens(String jwt, String refreshToken) async {
    await _secureStorage.write(key: 'jwt', value: jwt);
    await _secureStorage.write(key: 'refreshToken', value: refreshToken);
  }

  // Guardar datos del usuario
  void saveUser(Map<String, dynamic> userData) {
    _box.write('userData', userData);
  }

  // Obtener datos del usuario
  Map<String, dynamic>? getUser() {
    return _box.read('userData');
  }

  Future<String?> getJwt() async => await _secureStorage.read(key: 'jwt');
  Future<String?> getRefreshToken() async =>
      await _secureStorage.read(key: 'refreshToken');

  Future<void> clearTokens() async {
    await _secureStorage.deleteAll();
  }

  // Guardar estado de inicio de sesión
  void saveLoggedIn(bool value) => _box.write('isLoggedIn', value);
  bool get isLoggedIn => _box.read('isLoggedIn') ?? false;

  // Limpiar todos los datos de autenticación
  Future<void> clearAll() async {
    await clearTokens();
    _box.remove('userData');
    _box.remove('isLoggedIn');
  }
}
