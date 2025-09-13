// lib/shared/UI/layouts/widgets/sidebar.dart
import 'package:flutter/material.dart';

import '../../../themes/colors.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SidebarItem(
            icon: Icons.person,
            label: 'Usuarios',
            onTap: () {
              // Aquí podrías usar un provider para cambiar el módulo activo
            },
          ),
          SidebarItem(
            icon: Icons.dashboard,
            label: 'Otro Módulo',
            onTap: () {
              // Cambiar módulo activo
            },
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey[700]),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
