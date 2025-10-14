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
      body: LayoutBuilder(
        builder: (context, constraints) {
          todoC.updateLayout(constraints); // pindah logika responsif ke controller

          return Obx(() {
            if (todoC.todos.isEmpty) {
              return const Center(child: Text("Belum ada tugas"));
            }

            final todos = [...todoC.pendingTodos, ...todoC.doneTodos];

            return todoC.isMobile.value
                ? ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: todos.length,
                    itemBuilder: (context, index) =>
                        _buildTodoCard(context, todoC, todos[index]),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    padding: const EdgeInsets.all(16),
                    childAspectRatio: 2.8,
                    children: todos
                        .map((todo) => _buildTodoCard(context, todoC, todo))
                        .toList(),
                  );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: todoC.goToAddTodo, // logic pindah ke controller
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTodoCard(BuildContext context, TodoController todoC, dynamic todo) {
    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      background: _buildDeleteBackground(),
      confirmDismiss: (_) => todoC.confirmDeleteDialog(todo.id),
      onDismissed: (_) => todoC.deleteTodo(todo.id),
      child: _buildCardContent(todoC, todo),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
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
    );
  }

  Widget _buildCardContent(TodoController todoC, dynamic todo) {
    return Card(
      color: todo.isDone ? Colors.grey[200] : Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: todo.isDone,
              activeColor: AppColors.primary,
              onChanged: (_) => todoC.toggleDone(todo.id),
            ),
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
                          todo.isDone ? TextDecoration.lineThrough : null,
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => todoC.goToEdit(todo),
            ),
          ],
        ),
      ),
    );
  }
}
