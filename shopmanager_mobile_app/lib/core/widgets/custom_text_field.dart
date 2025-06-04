import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool? obscureText;

  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary),
          borderRadius: BorderRadius.circular(8),
        ),
        // fillColor: colorScheme.secondary,
        // filled: true,
      ),
    );
  }
}
