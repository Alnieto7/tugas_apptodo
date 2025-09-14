import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:tugas_apptodo/controllers/AuthController.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import '../component/custom_button.dart';
import '../component/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  final AuthController authController = Get.find();

  LoginPage({super.key});

  @override
  Widget build(BuildContext index) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(label: "Username", controller: username),
            const SizedBox(height: 16),
            CustomTextField(label: "Password", controller: password, isPassword: true),
            const SizedBox(height: 24),
            CustomButton(
              text: "Login",
              onPressed: () {
                Get.offAllNamed(AppRoutes.dashboard, arguments: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
