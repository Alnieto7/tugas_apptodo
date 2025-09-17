import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/tito.jpg"),
            ),
            const SizedBox(height: 12),
            const Text("Nama: Tito", style: TextStyle(fontSize: 18)),
            const Text("Email: alnieto7170@gmail.com"),
            const Text("11 PPLG 2 (30)"),
            const SizedBox(height: 24),

            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/awan.jpg"),
            ),
            const SizedBox(height: 12),
            const Text("Nama: Andrean Awan", style: TextStyle(fontSize: 18)),
            const Text("Email: andreanawan634@gmail.com"),
            const Text("11 PPLG 2 (7)"),
            const SizedBox(height: 24),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Apakah kamu yakin ingin logout?",
                  textCancel: "Batal",
                  textConfirm: "Logout",
                  confirmTextColor: AppColors.white,
                  onConfirm: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                );
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
