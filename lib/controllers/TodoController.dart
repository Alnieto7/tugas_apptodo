import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final todos = <TodoModel>[].obs;

  void addTodo(String title, String description, String category, String date, String time) {
    final todo = TodoModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
      category: category,
      date: date, 
      time: time, 
    );
    todos.insert(0, todo);
  }

  void saveTodo(String title, String description, String category, String date, String time) {
    if (title.isNotEmpty && description.isNotEmpty) {
      addTodo(title, description, category, date, time);
      Get.back();
      Get.snackbar("Sukses", "Todo berhasil ditambahkan",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Judul dan Deskripsi tidak boleh kosong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void toggleDone(String id) {
    final idx = todos.indexWhere((t) => t.id == id);
    if (idx >= 0) {
      final t = todos[idx];
      todos[idx] = TodoModel(
        id: t.id,
        title: t.title,
        description: t.description,
        category: t.category,
        isDone: !t.isDone,
        date: t.date,
        time: t.time,
      );
    }
  }

  void deleteTodo(String id) {
    todos.removeWhere((t) => t.id == id);
  }

  void deleteDone(String id) {
    final idx = todos.indexWhere((t) => t.id == id && t.isDone);
    if (idx >= 0) {
      todos.removeAt(idx);
      Get.snackbar("Dihapus", "Todo selesai berhasil dihapus",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void editTodo(String id, String newTitle, String newDescription, String newCategory, String newDate, String newTime) {
    final idx = todos.indexWhere((t) => t.id == id);
    if (idx >= 0) {
      todos[idx] = TodoModel(
        id: todos[idx].id,
        title: newTitle,
        description: newDescription,
        category: newCategory,
        date: newDate,
        time: newTime,
        isDone: todos[idx].isDone,
      );
      Get.back();
      Get.snackbar("Sukses", "Todo berhasil diedit",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  List<TodoModel> get doneTodos => todos.where((t) => t.isDone).toList();
  List<TodoModel> get pendingTodos => todos.where((t) => !t.isDone).toList();
}
