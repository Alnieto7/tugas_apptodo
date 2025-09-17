import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';
import 'package:tugas_apptodo/pages/TodoPage.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import '../color/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        return ListView.builder(
          itemCount: todoC.todos.length,
          itemBuilder: (context, index) {
            final todo = todoC.todos[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todo.description),
                    const SizedBox(height: 4),
                    Chip(
                      label: Text(todo.category),
                      backgroundColor: AppColors.secondary.withOpacity(0.2),
                      labelStyle: const TextStyle(color: AppColors.secondary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "📅 ${todo.date} | ⏰ ${todo.time}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Get.to(
                          () => AddTodoPage(
                            isEdit: true, 
                            todoId: todo.id,
                            title: todo.title,
                            description: todo.description,
                            category: todo.category,
                            date: todo.date,
                            time: todo.time,
                          ),
                        );
                      },
                    ),
                   
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.addtodo,
                          arguments: {
                            "isEdit": true,
                            "todoId": todo.id,
                          },
                        );
                      },
                    ),
                  ],
                ),
                onTap: () => todoC.toggleDone(todo.id),
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
