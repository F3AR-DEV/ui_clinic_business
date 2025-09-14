import 'package:flutter/material.dart';
import 'user_row.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        // Encabezado
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  "Foto",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Nombre",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Usuario",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Correo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Teléfono",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Acciones",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

        // Filas de usuarios (mock visual)
        const UserRow(
          name: "Fredel Ariel",
          username: "Procmefa.Fredel",
          email: "fredelobando@outlook.com",
          phone: "505 77772321",
        ),
        const UserRow(
          name: "Fredel Usuario",
          username: "Correo",
          email: "Correo",
          phone: "Teléfono",
        ),
        const UserRow(
          name: "Fredel Usuario",
          username: "Correo",
          email: "Correo",
          phone: "Teléfono",
        ),
      ],
    );
  }
}
