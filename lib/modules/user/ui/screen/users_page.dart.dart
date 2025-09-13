import 'package:flutter/material.dart';
import 'package:ui_clinic_business/modules/user/ui/widgets/user_table.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Nuevo Usuario"),
            ),
          ),
        ],
      ),
      body: const Column(children: [Expanded(child: UsersTable())]),
    );
  }
}
