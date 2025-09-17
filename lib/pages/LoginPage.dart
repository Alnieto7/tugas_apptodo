import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/AuthController.dart';
import '../component/custom_button.dart';
import '../component/custom_textfield.dart';
import '../color/app_colors.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage("assets/images/list.png"),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),

              const Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              CustomTextField(
                label: "Username",
                controller: authController.username,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                label: "Password",
                controller: authController.password,
                isPassword: true,
              ),
              const SizedBox(height: 24),

              CustomButton(
                text: "Login",
                onPressed: () {
                  authController.login();
                },
              ),

              const SizedBox(height: 32),

              const Text(
                "Login melalui : ",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.snackbar("Info", "Login Google belum tersedia"),
                    child: Image.asset(
                      "assets/images/google.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 24),

                  GestureDetector(
                    onTap: () => Get.snackbar("Info", "Login Apple belum tersedia"),
                    child: Image.asset(
                      "assets/images/apple.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 24),

                  GestureDetector(
                    onTap: () => Get.snackbar("Info", "Login Edge belum tersedia"),
                    child: Image.asset(
                      "assets/images/edgee.jpeg",
                      width: 55,
                      height: 55,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
