import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const CustomSearchField({
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
