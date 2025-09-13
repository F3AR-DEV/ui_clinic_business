// lib/shared/UI/layouts/dashboard_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_clinic_business/modules/user/ui/screen/users_page.dart.dart';
import 'widgets/navbar.dart';
import 'widgets/sidebar.dart'; // Asegúrate de tener este widget

class DashboardLayout extends ConsumerWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(),
          Expanded(
            child: Row(
              children: [
                Sidebar(), // Tu barra lateral
                //Expanded(child: Expanded(child: UsersPage())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
