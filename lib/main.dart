import 'package:flutter/material.dart';
import 'package:hive/hive.dart';//databaase library;
import 'package:hive_flutter/hive_flutter.dart';//database library
import 'package:todo_list/home_page.dart';
Future<void> main() async {
  await Hive.initFlutter();
  var box =await Hive.openBox('mybox');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(primarySwatch:Colors.yellow),
    );
  }
}
