import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/theme.dart';
import 'package:tugas_apptodo/pages/DashboardPage.dart';
import 'package:tugas_apptodo/pages/HomePage.dart';
import 'package:tugas_apptodo/pages/LoginPage.dart';
import 'package:tugas_apptodo/pages/TodoPage.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import 'bindings/auth_binding.dart';
import 'bindings/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Todo List App',
  theme: AppTheme.lightTheme,
  initialRoute: AppRoutes.splashscreen,
  initialBinding: BindingsBuilder(() {
    AuthBinding().dependencies();
    HomeBinding().dependencies();
  }),
  getPages: [
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/dashboard', page: () => DashboardPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/add', page: () => AddTodoPage()),
      ],
    );
  }
}
