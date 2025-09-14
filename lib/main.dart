import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_clinic_business/shared/UI/layouts/dashboard_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ✅ Importar kIsWeb para diferenciar web de escritorio
import 'package:flutter/foundation.dart' show kIsWeb;

// ✅ Importar Platform solo si NO es web (esto está ok porque arriba usamos kIsWeb)
import 'dart:io' show Platform;

// ❌ window_manager NO funciona en web, por eso lo condicionamos más abajo
import 'package:window_manager/window_manager.dart';

import 'shared/themes/index_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Solución: Solo ejecutar window_manager en escritorio, no en web
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

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clinica Procmefa',
      theme: appTheme,
      home: ScreenTypeLayout.builder(
        mobile: (_) => const DashboardLayout(),
        tablet: (_) => const DashboardLayout(),
        desktop: (_) => const DashboardLayout(),
      ),
    );
  }
}
