import 'package:flutter/material.dart';
import 'package:tugas_apptodo/color/theme.dart';
import 'package:tugas_apptodo/pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: AppTheme.lightTheme,
      home:  LoginPage(),
    );
  }
}
