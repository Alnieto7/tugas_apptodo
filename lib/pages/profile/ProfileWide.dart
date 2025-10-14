import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/controllers/ProfileController.dart';

class ProfileWide extends StatelessWidget {
  ProfileWide({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Profile (Tablet)"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Row(
        children: [
          // ✅ Sidebar
          Container(
            width: 280,
            color: AppColors.primary.withOpacity(0.05),
            child: ListView.builder(
              itemCount: controller.profiles.length,
              itemBuilder: (context, index) {
                final profile = controller.profiles[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(profile['image']!),
                  ),
                  title: Text(
                    profile['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(profile['email']!),
                  onTap: () => controller.goToPage(index),
                );
              },
            ),
          ),

          // ✅ Detail Profil
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.profiles.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                final profile = controller.profiles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage(profile['image']!),
                      ),
                      const SizedBox(height: 20),

                      // Info Card
                      Container(
                        width: 500,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile['name']!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              profile['email']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              profile['class']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Logout Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 3,
                        ),
                        onPressed: controller.showLogoutDialog,
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
