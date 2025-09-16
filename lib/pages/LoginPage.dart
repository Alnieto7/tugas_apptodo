import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/AuthController.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import '../component/custom_button.dart';
import '../component/custom_textfield.dart';
import '../color/app_colors.dart';

class LoginPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  final AuthController authController = Get.find();

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
              // Logo di tengah
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
              CustomTextField(label: "Username", controller: username),
              const SizedBox(height: 16),

              // Input Password
              CustomTextField(
                label: "Password",
                controller: password,
                isPassword: true,
              ),
              const SizedBox(height: 24),

              // Tombol Login
              CustomButton(
                text: "Login",
                onPressed: () {
                  // contoh login sederhana, nanti bisa validasi di AuthController
                  if (username.text == "admin" && password.text == "1234") {
                    Get.offAllNamed(AppRoutes.dashboard);
                  } else {
                    Get.snackbar(
                      "Login Gagal",
                      "Username atau password salah",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
              ),

              const SizedBox(height: 32),

              // Text "Login melalui"
              const Text(
                "Login melalui : ",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 12),

              // Icon Sosial Media (Google, Apple, Edge)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/google.png"),
                    iconSize: 40,
                    onPressed: () {
                      Get.toNamed(AppRoutes.dashboard); // contoh route
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Image.asset("assets/icons/apple.png"),
                    iconSize: 40,
                    onPressed: () {
                      Get.toNamed(AppRoutes.dashboard); // contoh route
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Image.asset("assets/icons/edge.png"),
                    iconSize: 40,
                    onPressed: () {
                      Get.toNamed(AppRoutes.dashboard); // contoh route
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
