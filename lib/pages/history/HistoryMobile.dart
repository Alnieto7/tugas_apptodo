import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';
import '../../component/custom_card.dart';


class HistoryMobile extends StatelessWidget {
  const HistoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final todoC = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: AppColors.primary,
      ),
      body: Obx(() {
        final done = todoC.doneTodos;
        if (done.isEmpty) {
          return const Center(child: Text("Belum ada tugas selesai"));
        }
        return ListView.builder(
          itemCount: done.length,
          itemBuilder: (context, index) {
            final todo = done[index];
            return CustomCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isCompleted: true,
              onTap: () => todoC.toggleDone(todo.id),
            );
          },
        );
      }),
    );
  }
}
