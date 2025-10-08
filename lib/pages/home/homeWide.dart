import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import '../../color/app_colors.dart';

class Homewide extends StatelessWidget {
  const Homewide({super.key});

  @override
  Widget build(BuildContext context) {
    final todoC = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: AppColors.primary,
      ),
      body: Obx(() {
        if (todoC.todos.isEmpty) {
          return const Center(child: Text("Belum ada tugas"));
        }

        
        final sortedTodos = [...todoC.pendingTodos, ...todoC.doneTodos];

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: sortedTodos.length,
          itemBuilder: (context, index) {
            final todo = sortedTodos[index];

            return Dismissible(
              key: Key(todo.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Hapus",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              confirmDismiss: (_) async {
                return await Get.dialog(
                  AlertDialog(
                    title: const Text("Konfirmasi"),
                    content: const Text("Yakin ingin menghapus todo ini?"),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(result: false),
                        child: const Text("Batal"),
                      ),
                      ElevatedButton(
                        onPressed: () => Get.back(result: true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Hapus"),
                      ),
                    ],
                  ),
                );
              },
              onDismissed: (_) => todoC.deleteTodo(todo.id),

              // Card UI
              child: Card(
                color: todo.isDone ? Colors.grey[200] : Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Checkbox
                      Checkbox(
                        value: todo.isDone,
                        activeColor: AppColors.primary,
                        onChanged: (_) => todoC.toggleDone(todo.id),
                      ),

                      // Isi Card
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todo.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration:
                                    todo.isDone
                                        ? TextDecoration.lineThrough
                                        : null,
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
                                  backgroundColor: AppColors.secondary
                                      .withOpacity(0.2),
                                  labelStyle: const TextStyle(
                                    color: AppColors.secondary,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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

                      // Tombol Edit
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.addtodo,
                            arguments: {
                              "isEdit": true,
                              "todoId": todo.id,
                              "title": todo.title,
                              "description": todo.description,
                              "category": todo.category,
                              "date": todo.date,
                              "time": todo.time,
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () {
          Get.toNamed(AppRoutes.addtodo);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
