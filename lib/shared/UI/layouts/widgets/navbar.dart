// lib/shared/UI/layouts/widgets/navbar.dart
import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/UI/widgets/search_widget.dart';
import 'package:ui_clinic_business/shared/utils/widget_ext.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(5, 3),
            blurRadius: 5,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        children: [
          // 1. Logo e Identidad del sistema (izquierda)
          // Usamos una Row para la imagen y los textos
          Row(
            children: [
              // Sustituye con tu ruta de imagen
              const SizedBox(width: 8),
              const Text(
                "CLINICA PROCMEFA",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 24,
              ), // Espacio entre "CLINICA PROCMEFA" y "Recepción"
              const Text(
                "Recepción",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF243B6B),
                ),
              ),
            ],
          ),

          // 2. Separador para empujar los siguientes elementos a la derecha
          const Spacer(),

          // 3. Grupo de elementos de la derecha (búsqueda e iconos)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SearchWidget(),
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
              CircleAvatar(child: Icon(Icons.person)),
            ].withSpacing(const SizedBox(width: 35)),
          ),
        ],
      ),
    );
  }
}
