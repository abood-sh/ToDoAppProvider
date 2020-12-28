import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sqflite_with_provider/model/task.dart';
import 'package:sqflite_with_provider/share_widgets/task_widget.dart';

import '../provider.dart';


class AllTasksPage extends StatefulWidget {
  List<TaskModel> array=[];
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<AllTasksPage> {
   myFun() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder:(a,value,b) {
       print(value.array);
        return SingleChildScrollView(
          child: Column(
            children:value.array.map((e) => TaskWidget(e)).toList(),
          ),
        );
      });
  }
}