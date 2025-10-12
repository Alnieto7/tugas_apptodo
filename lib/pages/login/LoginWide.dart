import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/AuthController.dart';
import '../../component/custom_button.dart';
import '../../component/custom_textfield.dart';
import '../../color/app_colors.dart';

class LoginWide extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  LoginWide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/list.png",
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Kelola tugas harianmu dengan mudah\nlangsung dari aplikasi ini.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

        
          Expanded(
            flex: 1,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 40),

                    CustomTextField(
                      label: "Username",
                      controller: authController.usernameController,
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      label: "Password",
                      controller: authController.passwordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 32),

                    CustomButton(
                      text: "Login",
                      onPressed: () => authController.login(),
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
          ),
        ],
      ),
    );
  }
}
