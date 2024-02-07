import 'package:flutter/material.dart';
import 'package:note_mate/utils/constants/colors.dart';
import 'package:note_mate/utils/theme/custom_themes/text_themes.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: NoteMateColors.cardNotes)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: NoteMateColors.cardNotes)),
          fillColor: NoteMateColors.white,
          filled: true,
          hintText: hintText,
          hintStyle: NoteMateTextTheme.lightTextTheme.bodySmall,
        ),
      ),
    );
  }
}
