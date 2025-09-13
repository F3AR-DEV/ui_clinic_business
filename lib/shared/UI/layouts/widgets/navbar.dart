// lib/shared/UI/layouts/widgets/navbar.dart
import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/UI/widgets/search_widget.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          // Identidad del sistema
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "CLINICA PROCMEFA",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Administración",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          SearchWidget(),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          const CircleAvatar(child: Icon(Icons.person)),
        ],
      ),
    );
  }
}
