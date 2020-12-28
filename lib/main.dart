import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_with_provider/screens/Home.dart';
import 'package:sqflite_with_provider/provider.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<TaskProvider>(
        create: (context){
      return TaskProvider();
    },
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage())
    ,);
  }
}