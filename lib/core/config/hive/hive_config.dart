import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:ui_clinic_business/core/config/hive/hive_boxes.dart';

class HiveConfig {
  static final List<int> _encryptionKey = kIsWeb
      ? Uint8List(0)
      : Hive.generateSecureKey();

  static Future<void> init() async {
    if (kIsWeb) return; // No inicializamos Hive en Web

    await Hive.initFlutter();
    _registerAdapters();
    await _openBoxes();
  }

  static void _registerAdapters() {
    for (final adapter in HiveBoxes.encrypted.values) {
      if (!Hive.isAdapterRegistered(adapter.typeId)) {
        Hive.registerAdapter(adapter);
      }
    }
    for (final adapter in HiveBoxes.unencrypted.values) {
      if (!Hive.isAdapterRegistered(adapter.typeId)) {
        Hive.registerAdapter(adapter);
      }
    }
  }

  static Future<void> _openBoxes() async {
    // Abrir boxes cifradas
    for (final entry in HiveBoxes.encrypted.entries) {
      await Hive.openBox(
        entry.key,
        encryptionCipher: HiveAesCipher(_encryptionKey),
      );
    }

    // Abrir boxes no cifradas
    for (final entry in HiveBoxes.unencrypted.entries) {
      await Hive.openBox(entry.key);
    }
  }

  static List<int> getEncryptionKey() => _encryptionKey;
}
