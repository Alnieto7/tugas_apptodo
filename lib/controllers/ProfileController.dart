import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_apptodo/routes/routes.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); 

   
    Get.offAllNamed(AppRoutes.login);

    Get.snackbar(
      "Logout",
      "Berhasil keluar dari aplikasi",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  var isMobile = true
      .obs; 

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
