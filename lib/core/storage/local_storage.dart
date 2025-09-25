import 'package:get_storage/get_storage.dart';

class PreferencesStorage {
  final _box = GetStorage();

  void setThemeMode(String mode) => _box.write('theme', mode);
  String get themeMode => _box.read('theme') ?? 'light';

  void setLanguage(String lang) => _box.write('language', lang);
  String get language => _box.read('language') ?? 'es';
}
