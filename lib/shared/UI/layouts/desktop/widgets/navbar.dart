import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/ui/widgets/search_widget.dart';
import 'package:ui_clinic_business/shared/themes/colors.dart';
import 'package:ui_clinic_business/shared/ui/helper/children_gap.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(5, 3),
            blurRadius: 5,
            spreadRadius: 0.0,
          ),
        ],
        // border: const Border(
        //  bottom: BorderSide(
        //    color: Colors.black, // color del borde inferior
        //    width: 0.2, // grosor del borde
        //  ),
        // ),
      ),
      child: Row(
        children: [
          // 1. Logo e Identidad del sistema (izquierda)
          // Usamos una Row para la imagen y los textos
          Row(
            children: [
              // Use the correct relative path to the image
              Image.asset(
                'assets/img/logo.png',
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red);
                },
              ),
              const SizedBox(width: 20),
              const Text(
                "CLINICA PROCMEFA",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(width: 90),
              const Text(
                "Recepción",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF243B6B),
                ),
              ),
            ],
          ),
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
              IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              CircleAvatar(child: Icon(Icons.person)),
            ].withGap(SizedBox(width: 35)),
          ),
        ],
      ),
    );
  }
}
