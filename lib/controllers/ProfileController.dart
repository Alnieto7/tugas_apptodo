import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_apptodo/routes/routes.dart';

class ProfileController extends GetxController {
  final PageController pageController = PageController();
  final currentIndex = 0.obs;

  final List<Map<String, String>> profiles = [
    {
      'name': 'Salahaddin Alnieto R.',
      'email': 'alnieto7170@gmail.com',
      'class': '11 PPLG 2 (30)',
      'image': 'assets/images/tito.jpg',
    },
    {
      'name': 'Andrean Awan',
      'email': 'andreanawan634@gmail.com',
      'class': '11 PPLG 2 (7)',
      'image': 'assets/images/awan.jpg',
    },
  ];

  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

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

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
