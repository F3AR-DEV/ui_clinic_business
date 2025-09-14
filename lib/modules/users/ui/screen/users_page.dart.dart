import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/UI/helper/children_gap.dart';
import 'package:ui_clinic_business/shared/UI/widgets/app_card.dart';
import 'package:ui_clinic_business/shared/UI/widgets/custom_dialog.dart';
import 'package:ui_clinic_business/shared/UI/widgets/custom_textfield.dart';

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
              showDialog(
                context: context,
                builder: (ctx) => CustomTabDialog(
                  title: "Modal Acompañantes",
                  tabs: const [
                    Tab(text: "Nueva Cita"),
                    Tab(text: "Acompañante"),
                    Tab(text: "Edit Profile"),
                  ],
                  tabViews: [
                    // Tab 1
                    Center(child: Text("Formulario Nueva Cita")),

                    // Tab 2: Formulario de acompañante
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
                        TextField(
                          decoration: InputDecoration(labelText: "Nombre"),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Cédula de Identidad",
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Número de Teléfono",
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Parentesco Específico",
                          ),
                        ),
                      ],
                    ),

                    // Tab 3
                    Center(child: Text("Editar perfil")),
                  ],
                  onCancel: () => print("Cancelado"),
                  onSave: () => print("Guardado"),
                ),
              );
            },
            child: const Text("Abrir Modal"),
          ),
          AppCard(
            title: "Informacion del Paciente",
            child: Column(
              children: [
                CustomTextField(
                  label: 'Cédula de Identidad',
                  hint: '081-260011-1000A (Opcional)',
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  label: 'Numero de Celular',
                  hint: '081-260011-1000A (Opcional)',
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  label: 'Nombre Completo',
                  hint: '081-260011-1000A (Opcional)',
                  keyboardType: TextInputType.number,
                ),
              ].withGap(SizedBox(height: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
