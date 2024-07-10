import 'package:flutter/material.dart';
import 'package:today/constants/colors.dart';

class TodoButton extends StatelessWidget {
  TodoButton({super.key, required this.text, required this.onPressed});
  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: CColors().cDark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: CColors().cGreen, strokeAlign: 5.0)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: CColors().cLight),
      ),
    );
  }
}
