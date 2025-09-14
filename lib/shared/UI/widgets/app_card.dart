// lib/shared/UI/widgets/app_card.dart
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20,
                alignment: Alignment.bottomLeft, // Aquí alineas el texto
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1814f3),
                  ),
                ),
              ),

              SizedBox(height: 5),
              Container(
                height: 3, // grosor de la línea
                decoration: BoxDecoration(
                  color: Color(0xFF1814f3), // color de la línea
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10), // solo esquinas superiores
                  ),
                ),
              ),
              SizedBox(height: 20),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
