// lib/shared/UI/layouts/dashboard_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/navbar.dart';
import 'widgets/sidebar.dart';

class DesktopLayout extends ConsumerWidget {
  final Widget child;

  const DesktopLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const Navbar(),
          Expanded(
            child: Row(
              children: [
                const Sidebar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: child, // 👈 Aquí va el contenido dinámico
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
