import 'package:flutter/material.dart';
import 'package:note_mate/utils/constants/colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const MyButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: NoteMateColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: NoteMateColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          )),
        ));
  }
}
