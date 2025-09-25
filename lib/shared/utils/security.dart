import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:hive_ce/hive.dart';

class SecurityHelper {
  /// Genera una clave de 32 bytes para AES-256 a partir de una contraseña
  static Uint8List generateKeyFromPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return Uint8List.fromList(digest.bytes);
  }

  /// Genera un hash SHA-256 de una contraseña para almacenamiento seguro
  static String hashPassword(String password, {String salt = ""}) {
    final bytes = utf8.encode(password + salt);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Crea un HiveAesCipher a partir de una contraseña
  static HiveAesCipher createCipher(String password) {
    return HiveAesCipher(generateKeyFromPassword(password));
  }
}
