import 'package:flutter/material.dart';
import 'package:today/widgets/todo_button.dart';

class TodoDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  TodoDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Add a new task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TodoButton(text: 'Save', onPressed: onSave),
                const SizedBox(
                  width: 15.0,
                ),
                TodoButton(text: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
