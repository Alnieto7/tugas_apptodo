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
              // Logo
              const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage("assets/images/list.png"),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),

              // Welcome text
              const Text(
                "Selamat datang di App Todo List",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Input Username
              CustomTextField(
                label: "Username",
                controller: authController.username,
              ),
              const SizedBox(height: 16),

              // Input Password
              CustomTextField(
                label: "Password",
                controller: authController.password,
                isPassword: true,
              ),
              const SizedBox(height: 24),

              // Tombol Login
              CustomButton(
                text: "Login",
                onPressed: () {
                  authController.login();
                },
              ),

              const SizedBox(height: 32),

              // Text "Login melalui"
              const Text(
                "Login melalui : ",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 12),

              // Icon Sosial Media (contoh saja)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/google.png"),
                    iconSize: 40,
                    onPressed: () {
                      Get.snackbar("Info", "Login Google belum tersedia");
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Image.asset("assets/icons/apple.png"),
                    iconSize: 40,
                    onPressed: () {
                      Get.snackbar("Info", "Login Apple belum tersedia");
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Image.asset("assets/icons/edge.png"),
                    iconSize: 40,
                    onPressed: () {
                      Get.snackbar("Info", "Login Edge belum tersedia");
                    },
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
