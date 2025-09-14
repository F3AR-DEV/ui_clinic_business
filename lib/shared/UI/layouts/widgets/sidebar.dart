// lib/shared/UI/layouts/widgets/sidebar.dart
import 'package:flutter/material.dart';
import '../../../themes/colors.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int activeIndex = 0;

  final List<Map<String, dynamic>> modules = [
    {'icon': Icons.person, 'label': 'Usuarios'},
    {'icon': Icons.dashboard, 'label': 'Dashboard'},
    {'icon': Icons.settings, 'label': 'Configuración'},
    {'icon': Icons.report, 'label': 'Reportes'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColors.white, // color movido aquí
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(3, 5),
            blurRadius: 5,
            spreadRadius: 0.0, // Expansión o reducción de la sombra
          ),
        ],
        border: const Border(
          right: BorderSide(
            color: Colors.black, // color del borde inferior
            width: 0.2, // grosor del borde
          ),
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

class SidebarItem extends StatefulWidget {
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
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    Color bgColor = widget.isActive
        ? AppColors.primaryBlue.withOpacity(0.15)
        : isHover
        ? Colors.grey.withOpacity(0.1)
        : Colors.transparent;

    Color iconColor = widget.isActive
        ? AppColors.primaryBlue
        : Colors.grey[700]!;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          color: bgColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(widget.icon, size: 20, color: iconColor),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isActive
                      ? AppColors.primaryBlue
                      : Colors.black87,
                  fontWeight: widget.isActive
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
