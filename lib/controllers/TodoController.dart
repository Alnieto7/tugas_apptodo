import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/todo_model.dart';
import '../Db/db_helper.dart';
import '../routes/routes.dart';

class TodoController extends GetxController {
  final todos = <TodoModel>[].obs;
  final dbHelper = DatabaseHelper();

  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  // ✅ Ambil semua todo dari database
  Future<void> loadTodos() async {
    final data = await dbHelper.getTodos();
    todos.assignAll(data);
  }

  // ✅ Tambah todo baru
  Future<void> addTodo(
    String title,
    String description,
    String category,
    String date,
    String time,
  ) async {
    final todo = TodoModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
      category: category,
      date: date,
      time: time,
    );
    await dbHelper.insertTodo(todo);
    todos.insert(0, todo);
  }

  // ✅ Update status done / undone
  Future<void> toggleDone(String id) async {
    final idx = todos.indexWhere((t) => t.id == id);
    if (idx >= 0) {
      final t = todos[idx];
      final updated = TodoModel(
        id: t.id,
        title: t.title,
        description: t.description,
        category: t.category,
        isDone: !t.isDone,
        date: t.date,
        time: t.time,
      );
      await dbHelper.updateTodo(updated);
      todos[idx] = updated;
    }
  }

  // ✅ Hapus todo
  Future<void> deleteTodo(String id) async {
    await dbHelper.deleteTodo(id);
    todos.removeWhere((t) => t.id == id);
    Get.snackbar(
      "Dihapus",
      "Todo berhasil dihapus",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.1),
    );
  }

  // ✅ Edit todo
  Future<void> editTodo(
    String id,
    String newTitle,
    String newDescription,
    String newCategory,
    String newDate,
    String newTime,
  ) async {
    final idx = todos.indexWhere((t) => t.id == id);
    if (idx >= 0) {
      final updated = TodoModel(
        id: id,
        title: newTitle,
        description: newDescription,
        category: newCategory,
        date: newDate,
        time: newTime,
        isDone: todos[idx].isDone,
      );
      await dbHelper.updateTodo(updated);
      todos[idx] = updated;
    }
  }

  // ✅ Pisahkan todo yang sudah dan belum selesai
  List<TodoModel> get doneTodos => todos.where((t) => t.isDone).toList();
  List<TodoModel> get pendingTodos => todos.where((t) => !t.isDone).toList();

  // ✅ Navigasi ke halaman tambah todo
  void goToAddTodo() {
    Get.toNamed(AppRoutes.addtodo);
  }

  // ✅ Navigasi ke halaman edit todo
  void goToEdit(dynamic todo) {
    Get.toNamed(AppRoutes.addtodo, arguments: {
      "isEdit": true,
      "todoId": todo.id,
      "title": todo.title,
      "description": todo.description,
      "category": todo.category,
      "date": todo.date,
      "time": todo.time,
    });
  }

  // ✅ Dialog konfirmasi hapus
  Future<bool?> confirmDeleteDialog(String id) {
    return Get.dialog(
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }
}
