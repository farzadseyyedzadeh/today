import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  final myBox = Hive.box('mybox');

  List toDoList = [];

  void createInitialData() {
    toDoList = [
      ['make tutorial', false],
      ['do exercise', false],
    ];
  }

  void loadData() {
    toDoList = myBox.get('TODOLIST');
  }

  void updateDataBase() {
    myBox.put('TODOLIST', toDoList);
  }
}
