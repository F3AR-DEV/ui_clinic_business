import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/animations/animated_dialog.dart';
import 'package:ui_clinic_business/shared/themes/colors.dart';

Future<T?> showCustomTabDialog<T>({
  required BuildContext context,
  required List<Tab> tabs,
  required List<Widget> tabViews,
  VoidCallback? onCancel,
  VoidCallback? onSave,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dialog",
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, _, _) => const SizedBox.shrink(),
    transitionBuilder: (context, anim, _, _) {
      return AnimatedDialogContent(
        animation: anim,
        child: _CustomDialogContent(
          tabs: tabs,
          tabViews: tabViews,
          onCancel: onCancel,
          onSave: onSave,
        ),
      );
    },
  );
}

// ... _CustomDialogContent y _DialogButton permanecen igual

/// Contenido del diálogo (tabs, tabViews y botones)
class _CustomDialogContent extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;

  const _CustomDialogContent({
    required this.tabs,
    required this.tabViews,
    this.onCancel,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: DefaultTabController(
          length: tabs.length,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tabs
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: AppColors.primaryBlue,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: AppColors.primaryBlue,
                  tabs: tabs,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                ),
                // Tab views
                Container(
                  height: 300,
                  color: AppColors.backgroundLight,
                  padding: const EdgeInsets.all(20),
                  child: TabBarView(children: tabViews),
                ),
                // Botones
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _DialogButton(
                        text: "Cancelar",
                        backgroundColor: Colors.grey[300]!,
                        foregroundColor: Colors.grey[700]!,
                        onPressed: () {
                          Navigator.of(context).pop();
                          onCancel?.call();
                        },
                      ),
                      const SizedBox(width: 12),
                      _DialogButton(
                        text: "Guardar",
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                          onSave?.call();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Botón reutilizable del diálogo
class _DialogButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  const _DialogButton({
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
