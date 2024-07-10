import 'package:flutter/material.dart';
import 'package:today/constants/colors.dart';
import 'package:today/widgets/todo_button.dart';

class TodoDialog extends StatelessWidget {
  final TextEditingController controller;
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
      backgroundColor: CColors().cLight,
      content: Container(
        height: 180.0,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  errorText: controller.text.isEmpty ? 'no task added' : '',
                  hintText: 'Add a new task',
                  hintStyle: TextStyle(color: CColors().cGreen),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
