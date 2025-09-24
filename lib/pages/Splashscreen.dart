import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:tugas_apptodo/controllers/Splashscreen_Controller.dart';

class SplashscreenPage extends StatelessWidget{
  SplashscreenPage({super.key});

   final Controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 24),

            const Text(
              "Tugas Harian",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              "Manage your tasks easily",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 32),

            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
  
}