import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_apptodo/routes/routes.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login() async {
    if (usernameController.text.toString() == "admin" && passwordController.text.toString() == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.dashboard);
      Get.snackbar(
         "Login Berhasil",
         "Selamat datang ${usernameController.text}",
         snackPosition: SnackPosition.BOTTOM,
        );
    }
    else {
      Get.snackbar(
         "Login Gagal",
         "Username atau password salah",
         backgroundColor: Colors.red,
         colorText: Colors.white,
        );
    }
  }

   var isMobile = true
      .obs; 

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }



 
}
