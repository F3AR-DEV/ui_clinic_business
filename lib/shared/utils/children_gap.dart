import 'package:flutter/material.dart';

// Extensión para listas de widgets
extension WidgetListExtension on List<Widget> {
  // Método que devuelve la lista intercalada con un widget de separación
  List<Widget> withGap(Widget gapWidget) {
    // Si la lista está vacía, retornamos una lista vacía
    if (isEmpty) return [];

    // Lista donde guardaremos los widgets intercalados con los espacios
    List<Widget> gapList = [];

    // Recorremos cada widget de la lista original
    for (int i = 0; i < length; i++) {
      // Agregamos el widget actual a la nueva lista
      gapList.add(this[i]);

      // Si NO es el último elemento, agregamos el widget de separación
      if (i < length - 1) {
        gapList.add(gapWidget);
      }
    }

    // Retornamos la lista final con los widgets separados
    return gapList;
  }
}
