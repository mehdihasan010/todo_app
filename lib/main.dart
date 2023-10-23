import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();

  // ignore: unused_local_variable
  var box = await Hive.openBox('myboxs');
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MaterialColor mycolor = const MaterialColor(
    0xFFFFF200,
    <int, Color>{
      50: Color(0xFFFFF200),
      100: Color(0xFFFFF200),
      200: Color(0xFFFFF200),
      300: Color(0xFFFFF200),
      400: Color(0xFFFFF200),
      500: Color(0xFFFFF200),
      600: Color(0xFFFFF200),
      700: Color(0xFFFFF200),
      800: Color(0xFFFFF200),
      900: Color(0xFFFFF200),
    },
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mycolor),
      home: const HomePage(),
    );
  }
}
