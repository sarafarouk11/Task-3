import 'package:flutter/material.dart';
import 'package:task2/HomeNav.dart';


import 'Task2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
    fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
        color: Colors.grey
    )
        ),
      home: home(),
    );
  }
}
