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
            const Text("Email: tito@example.com"),
            const SizedBox(height: 24),

            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/awan.jpg"),
            ),
            const SizedBox(height: 12),
            const Text("Nama: Andrean Awan", style: TextStyle(fontSize: 18)),
            const Text("Email: andreanawan634@gmail.com"),
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
                Get.offAllNamed(AppRoutes.login);
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
