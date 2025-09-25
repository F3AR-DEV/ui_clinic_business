import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_controller.g.dart';

@riverpod
TextEditingController textController(Ref ref, {required String fieldKey}) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
}
