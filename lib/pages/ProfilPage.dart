import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/controllers/ProfileController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> profiles = [
    {
      'name': 'Tito',
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

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile indicator
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                profiles.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == index
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // PageView for profiles
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Profile Avatar with shadow
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(profile['image']!),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Profile Info Card
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Nama: ${profile['name']!}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Email: ${profile['email']!}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              profile['class']!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                );
              },
            ),
          ),

          // Profile counter at bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "${_currentIndex + 1} dari ${profiles.length} profil",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),

          // Logout Button - Single button for all profiles
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Apakah kamu yakin ingin logout?",
                  textCancel: "Batal",
                  textConfirm: "Logout",
                  confirmTextColor: AppColors.white,
                  onConfirm: () {
                    profileC.logout();
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
