import 'package:flutter/material.dart';
import './screens/subject_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Content Sharing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SubjectsScreen(),
    );
  }
}

