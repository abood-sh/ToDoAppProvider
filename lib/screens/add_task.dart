import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_with_provider/model/task.dart';

import '../provider.dart';

class AddTask extends StatelessWidget {
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Container(
        child: Consumer<TaskProvider>(builder: (context, provider, c) {
          return ListView(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Checkbox(
                          value: provider.value,
                          onChanged: (value) {
                            provider.value = !provider.value;
                          }),
                      labelText: "Title :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (val) {
                    this.taskName = val;
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Consumer<TaskProvider>(
                          builder: (context, provider, c) {
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'SAVE',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            provider
                                .insertTask(
                                    TaskModel(this.taskName, provider.value))
                                .whenComplete(() => Navigator.pop(context));
                          },
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
