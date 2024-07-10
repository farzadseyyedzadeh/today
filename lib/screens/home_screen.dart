import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:today/data/database.dart';
import 'package:today/widgets/todo_dialog.dart';
import 'package:today/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (myBox.get('TODOLIST') == null) {
    } else {
      db.loadData();
    }
    super.initState();
  }

  final textController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([textController.text, false]);
      textController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TodoDialog(
            controller: textController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop());
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        title: const Text('TODAY'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: db.toDoList.isEmpty
          ? Center(child: Image.asset('assets/images/no-task.png'))
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todoTitle: db.toDoList[index][0],
                  isDone: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onDeleted: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
