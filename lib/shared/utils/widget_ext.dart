import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget> {
  List<Widget> withSpacing(Widget spacingWidget) {
    if (isEmpty) return [];

    List<Widget> spacedList = [];
    for (int i = 0; i < length; i++) {
      spacedList.add(this[i]);
      if (i < length - 1) {
        spacedList.add(spacingWidget);
      }
    }
    return spacedList;
  }
}
