import 'package:hive_ce/hive.dart';

class HiveBoxes {
  // Boxes cifradas
  static final Map<String, TypeAdapter> encrypted = {
    // 'users': UserAdapter(),
    // 'tokens': TokenAdapter(),
  };

  // Boxes no cifradas
  static final Map<String, TypeAdapter> unencrypted = {
    // 'settings': SettingsAdapter(),
    // 'cache_items': CacheItemAdapter(),
  };
}
