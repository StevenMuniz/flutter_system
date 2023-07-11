import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration defaultInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      /*  border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
       */
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey.shade50),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[50]!),
        borderRadius: BorderRadius.circular(15),
      ),
      filled: true,
      fillColor: Colors.blueGrey[50],
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(fontSize: 12, color: Colors.black54),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration inputDecorationDefault({
    Widget prefixIcon = const Icon(
      Icons.edit_note_outlined,
      color: Colors.grey,
    ),
    Widget? suffixIcon,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.grey[100],
        filled: true);
  }

  static InputDecoration inputDecoration1(
      {required String hint,
      required String label,
      Widget? prefixIcon = const Icon(
        Icons.edit_note_outlined,
        color: Colors.grey,
      ),
      Widget? suffixIcon,
      Color color = Colors.grey}) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: color.withOpacity(0.3))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: color),
        hintStyle: TextStyle(color: color),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        fillColor: const Color.fromARGB(255, 244, 243, 243),
        filled: true);
  }
}
