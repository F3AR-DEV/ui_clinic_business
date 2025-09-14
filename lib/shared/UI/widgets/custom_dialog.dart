import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/animations/animated_dialog.dart';

class CustomTabDialog extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;

  const CustomTabDialog({
    super.key,
    required this.title,
    required this.tabs,
    required this.tabViews,
    this.onCancel,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDialog(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: DefaultTabController(
          length: tabs.length,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 600, // 👈 tamaño fijo ancho para escritorio
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Título
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 🔹 TabBar
                TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  tabs: tabs,
                ),
                const SizedBox(height: 12),

                // 🔹 Contenido del Tab
                Expanded(child: TabBarView(children: tabViews)),

                const SizedBox(height: 16),

                // 🔹 Botones fijos abajo
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[700],
                        backgroundColor: Colors.grey[300],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (onCancel != null) onCancel!();
                      },
                      child: const Text("Cancelar"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (onSave != null) onSave!();
                      },
                      child: const Text("Guardar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
