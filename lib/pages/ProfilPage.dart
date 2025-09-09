import 'package:flutter/material.dart';
import 'package:tugas_apptodo/color/app_colors.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppColors.primary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.person, size: 50, color: AppColors.white),
            ),
            SizedBox(height: 12),
            Text("Nama: Tito", style: TextStyle(fontSize: 18)),
            Text("Email: tito@example.com"),
          ],
        ),
      ),
    );
  }
}
