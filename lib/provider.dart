import 'package:flutter/widgets.dart';

import 'db/db.dart';
import 'model/task.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> array = List<TaskModel>();
  bool value = false;

  Future getData() async {
    List<TaskModel> newArray = [];
    await DBHelper.dbHelper
        .getAllTask()
        .then((value) => value.forEach((element) {
              newArray.add(TaskModel.fromMap(element));
            }))
        .whenComplete(() => array.clear())
        .whenComplete(() => array.addAll(newArray))
        .whenComplete(() => notifyListeners());
  }

  updateTask(TaskModel task) async {
    await DBHelper.dbHelper
        .updateTask(task)
        .whenComplete(() => notifyListeners());
  }

  deleteTask(int id) async {
    await DBHelper.dbHelper.deleteTask(id);
    getData();
  }

  Future insertTask(TaskModel task) async {
    await DBHelper.dbHelper.insertTask(task);
    getData();
  }
}
