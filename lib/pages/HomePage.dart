import 'package:flutter/material.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/pages/TodoPage.dart';
import '../component/custom_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = [
      {"title": "Belajar Flutter", "desc": "Latihan GetX", "cat": "Sekolah"},
      {"title": "Olahraga", "desc": "Lari pagi", "cat": "Pribadi"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        children: todos.map((todo) {
          return CustomCard(
            title: todo["title"]!,
            description: todo["desc"]!,
            category: todo["cat"]!,
            onTap: () {},
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTodoPage()),
          );
        },
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
