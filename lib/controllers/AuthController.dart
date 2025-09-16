import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/pages/DashboardPage.dart';
import 'package:tugas_apptodo/pages/LoginPage.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  var isLoggedIn = false.obs;

  void login() {
    if (username.text == "admin" && password.text == "1234") {
      isLoggedIn.value = true;
      Get.offAll(() => const DashboardPage());
      Get.snackbar(
        "Login Berhasil",
        "Selamat datang ${username.text}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Login Gagal",
        "Username atau password salah",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }
}
