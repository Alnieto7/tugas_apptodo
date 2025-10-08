import 'package:flutter/material.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/pages/history/HistoryMobile.dart';
import 'package:tugas_apptodo/pages/history/HistoryPage.dart';
import 'package:tugas_apptodo/pages/home/HomeMobile.dart';
import 'package:tugas_apptodo/pages/ProfilPage.dart';
import 'package:tugas_apptodo/pages/home/HomePage.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages =  [
    Homepage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
