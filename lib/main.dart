import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_clinic_business/shared/UI/layouts/dashboard_layout.dart';

import 'package:window_manager/window_manager.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:io';

import 'shared/themes/index_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar window_manager si estamos en escritorio
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      size: const Size(1280, 720), // Tamaño inicial
      center: true, // Centrar la ventana
      title: "Clinica Procmefa", // Título de la ventana
      minimumSize: const Size(1280, 720), // Tamaño mínimo
      //maximumSize: const Size(1200, 900), // Tamaño máximo opcional
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
      theme: appTheme, // Usa la variable importada
      home: ScreenTypeLayout.builder(
        mobile: (_) => const DashboardLayout(), // Layout móvil
        tablet: (_) => const DashboardLayout(), // Layout tablet
        desktop: (_) => const DashboardLayout(), // Layout escritorio
      ),
    );
  }
}
