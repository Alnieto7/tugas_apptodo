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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 600;

          return Obx(() {
            final done = todoC.doneTodos;
            if (done.isEmpty) {
              return const Center(child: Text("Belum ada tugas selesai"));
            }

            final listWidget = isTablet
                ? GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    padding: const EdgeInsets.all(16),
                    childAspectRatio: 2.8,
                    children: done.map((todo) {
                      return _buildHistoryCard(todo);
                    }).toList(),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: done.length,
                    itemBuilder: (context, index) {
                      final todo = done[index];
                      return _buildHistoryCard(todo);
                    },
                  );

            return listWidget;
          });
        },
      ),
    );
  }

  Widget _buildHistoryCard(dynamic todo) {
    return Card(
      color: Colors.grey[200],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
            const SizedBox(width: 10),
            Expanded(
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
                  ),
                  const SizedBox(height: 4),
                  Text(
                    todo.description,
                    style: const TextStyle(fontSize: 14),
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
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text(
                        "📅 ${todo.date} | ⏰ ${todo.time}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
