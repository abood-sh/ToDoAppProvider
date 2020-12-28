import 'package:sqflite_with_provider/db/db.dart';

class TaskModel {
  int id;
  String taskName;
  bool value;

  TaskModel(this.taskName, this.value);

  static toMap(TaskModel taskModel) {
    return {
      DBHelper.columnTaskName: taskModel.taskName,
      DBHelper.columnTaskValueName: taskModel.value ? 1 : 0
    };
  }

  static TaskModel fromMap(Map map) {
    bool value;
    if (map[DBHelper.columnTaskValueName] == 1)
      value = true;
    else
      value = false;
    var task = TaskModel(map[DBHelper.columnTaskName], value);
    task.id = map[DBHelper.columnIdName];
    return task;
  }
}