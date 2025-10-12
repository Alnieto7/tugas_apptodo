import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';

class HistoryWide extends StatelessWidget {
  const HistoryWide({super.key});

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
          padding: const EdgeInsets.all(12),
          itemCount: done.length,
          itemBuilder: (context, index) {
            final todo = done[index];

            return Card(
              color: Colors.grey[200],
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      todo.description,
                      style: const TextStyle(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        Chip(
                          label: Text(todo.category),
                          backgroundColor: AppColors.secondary.withOpacity(0.2),
                          labelStyle: const TextStyle(
                            color: AppColors.secondary,
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        Text(
                          "📅 ${todo.date} | ⏰ ${todo.time}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
