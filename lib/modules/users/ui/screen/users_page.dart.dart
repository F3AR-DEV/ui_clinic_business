import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/UI/helper/children_gap.dart';
import 'package:ui_clinic_business/shared/UI/widgets/app_card.dart';
import 'package:ui_clinic_business/shared/UI/widgets/custom_textfield.dart';
import 'package:ui_clinic_business/shared/UI/widgets/custom_dialog.dart'; // <-- Importa tu diálogo

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              showCustomTabDialog(
                context: context,
                tabs: const [
                  Tab(text: "Nueva Cita"),
                  Tab(text: "Acompañante"),
                  Tab(text: "Edit Profile"),
                ],
                tabViews: [
                  const Center(child: Text("Formulario Nueva Cita")),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Información de acompañante",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Divider(color: Colors.blue, thickness: 1),
                      const SizedBox(height: 8),
                      const TextField(
                        decoration: InputDecoration(labelText: "Nombre"),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: "Cédula de Identidad",
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: "Número de Teléfono",
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: "Parentesco Específico",
                        ),
                      ),
                    ],
                  ),
                  const Center(child: Text("Editar perfil")),
                ],
                onCancel: () => print("Cancelado"),
                onSave: () => print("Guardado"),
              );
            },
            child: const Text("Abrir Modal"),
          ),

          AppCard(
            title: "Información del Paciente",
            child: Column(
              children: [
                CustomTextField(
                  label: 'Cédula de Identidad',
                  hint: '081-260011-1000A (Opcional)',
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  label: 'Número de Celular',
                  hint: '081-260011-1000A (Opcional)',
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  label: 'Nombre Completo',
                  hint: '081-260011-1000A (Opcional)',
                  keyboardType: TextInputType.number,
                ),
              ].withGap(const SizedBox(height: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
