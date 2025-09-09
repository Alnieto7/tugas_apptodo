import 'package:flutter/material.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import '../component/custom_card.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final completedTodos = [
      {"title": "Belajar Git", "desc": "Push ke GitHub", "cat": "Sekolah"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        children: completedTodos.map((todo) {
          return CustomCard(
            title: todo["title"]!,
            description: todo["desc"]!,
            category: todo["cat"]!,
            isCompleted: true,
          );
        }).toList(),
      ),
    );
  }
}
