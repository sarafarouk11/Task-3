import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task2/HomeNav.dart';
import 'package:task2/firebase_options.dart';
import 'package:task2/login.dart';


import 'Task2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home:FirebaseAuth.instance.currentUser != null ? home() : login(),
    );
  }
}
