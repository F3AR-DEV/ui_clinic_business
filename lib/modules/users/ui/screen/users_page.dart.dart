import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/UI/widgets/app_card.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppCard(
            title: 'Tarjeta 1',
            child: Text('Contenido corto', style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: 16),
          AppCard(
            title: 'Tarjeta 2',
            child: Text(
              'Esta tarjeta tiene un texto más ',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
