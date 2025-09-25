// lib/shared/UI/layouts/widgets/sidebar.dart
import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/themes/colors.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int activeIndex = 0;

  final List<Map<String, dynamic>> modules = [
    {'icon': Icons.home, 'label': 'Recepcion'},
    {'icon': Icons.circle, 'label': 'configuracion'},
    {'icon': Icons.compare_arrows, 'label': 'Otro Modulo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(3, 5),
            blurRadius: 5,
            spreadRadius: 0.0,
          ),
        ],
        border: const Border(
          right: BorderSide(color: Colors.black, width: 0.2),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            ...modules.asMap().entries.map((entry) {
              int idx = entry.key;
              var module = entry.value;
              return SidebarItem(
                icon: module['icon'],
                label: module['label'],
                isActive: idx == activeIndex,
                onTap: () {
                  setState(() {
                    activeIndex = idx;
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = isActive ? AppColors.primaryBlue : Colors.grey;
    Color textColor = isActive ? AppColors.primaryBlue : Colors.grey[700]!;

    return Material(
      color: Colors.transparent, // para que no opaque el fondo
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashColor: AppColors.primaryBlue.withOpacity(0.2), // color de la gota
        highlightColor: AppColors.primaryBlue.withOpacity(
          0.1,
        ), // cuando se mantiene presionado
        hoverColor: Colors.grey.withOpacity(0.1), // efecto hover en web/desktop
        child: SizedBox(
          height: 45, // altura uniforme
          child: Row(
            children: [
              // Indicador lateral
              Container(
                width: 5,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primaryBlue : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
              // Contenido
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(icon, size: 24, color: iconColor),
                      const SizedBox(width: 12),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold, // corrección
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
