import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:window_manager/window_manager.dart';

import 'core/core.dart';
import 'core/storage/sync_service.dart';
import 'shared/themes/index_themes.dart';

void main() async {
  // Asegura que los bindings de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializar variables de entorno
  await dotenv.load(fileName: ".env");
  // Inicializar GetStorage para manejar datos locales rápidos
  await GetStorage.init();
  // Inicializa Hive CE
  await Hive.initFlutter();

  // Inicializar sincronización automática
  final syncService = SyncService();
  syncService.startSync(interval: const Duration(seconds: 60)); // Cada 60s

  // Configuración de ventanas para escritorio (Windows, Linux, macOS)
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 720),
      center: true,
      title: "Clinica Procmefa",
      minimumSize: Size(1280, 720),
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // Ejecutar la app
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: 'Clinica Procmefa',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
