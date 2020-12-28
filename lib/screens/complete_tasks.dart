import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_with_provider/share_widgets/task_widget.dart';
import '../provider.dart';

class CompleteTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
        builder: (a, value, b) {
          print(value.array);
          return SingleChildScrollView(
            child: Column(
              children: value.array
                  .where((element) => element.value == true)
                  .map((e) => TaskWidget(e))
                  .toList(),
            ),
          );
        });
  }
}