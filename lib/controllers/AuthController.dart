import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/pages/DashboardPage.dart';
import 'package:tugas_apptodo/pages/LoginPage.dart';


class AuthController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  var isLoggedIn = false.obs;

  void login() {
    if (usernameC.text == "admin" && passwordC.text == "1234") {
      isLoggedIn.value = true;
      Get.offAll(() => const DashboardPage());
      Get.snackbar("Login Berhasil", "Selamat datang ${usernameC.text}",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.offAll(() => LoginPage());
      Get.snackbar("Login Gagal", "Username atau password salah",
          backgroundColor: Colors.red, colorText: Colors.white,
          );

    }
  }

  @override
  void onClose() {
    usernameC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
