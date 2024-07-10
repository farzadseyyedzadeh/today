import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.todoTitle,
      required this.isDone,
      required this.onChanged,
      required this.onDeleted});
  final String todoTitle;
  final bool isDone;
  final Function(bool?) onChanged;
  final void Function(BuildContext) onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25.0),
            ),
            onPressed: onDeleted,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade500,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade700,
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(25.0))),
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
          child: ListTile(
            leading: Checkbox(value: isDone, onChanged: onChanged),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Text(
              todoTitle,
              style: TextStyle(
                  decoration: isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ),
        ),
      ),
    );
  }
}
