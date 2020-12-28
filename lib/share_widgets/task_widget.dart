import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sqflite_with_provider/model/task.dart';

import '../provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel task;
  Function function;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (a, provider, b) {
        return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return AlertDialog(
                              title: Text("Confirm Delete"),
                              content: Text(
                                  "Are you sure you want to Delete Task ?"),
                              actions: [
                                FlatButton(
                                  child: Text("Yes"),
                                  onPressed: () async {
                                    provider.deleteTask(task.id);
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ]);
                        });
                  }),
              title: Text(task.taskName),
              trailing: Checkbox(
                  value: task.value,
                  onChanged: (value) {
                    task.value = !task.value;
                    provider.updateTask(task);
                  }),
            ));
      },
    );
  }
}
