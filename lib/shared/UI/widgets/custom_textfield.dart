import 'package:flutter/material.dart';
import 'package:ui_clinic_business/shared/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final double borderRadius;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label del campo
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 6),
        // Campo de texto
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF6B7A99), fontSize: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Color(0xFFD1D5DB),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: AppColors.primaryBlue,
                width: 1.2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ],
    );
  }
}
