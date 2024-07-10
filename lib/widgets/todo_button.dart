import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  TodoButton({super.key, required this.text, required this.onPressed});
  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.blueGrey.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
