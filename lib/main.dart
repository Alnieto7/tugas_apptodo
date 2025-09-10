import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tugas_apptodo/color/theme.dart';
import 'package:tugas_apptodo/pages/DashboardPage.dart';
import 'package:tugas_apptodo/pages/LoginPage.dart';
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
      home:  LoginPage(),
      initialBinding: AuthBinding(),
      getPages: [
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: AuthBinding(),
        ),
      ],
    );
  }
}
