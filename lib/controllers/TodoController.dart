import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/todo_model.dart';
import '../Db/db_helper.dart';

class TodoController extends GetxController {
  final todos = <TodoModel>[].obs;
  final dbHelper = DatabaseHelper();

  var isMobile = true
      .obs; 

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final data = await dbHelper.getTodos();
    todos.assignAll(data);
  }

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

  Future<void> deleteTodo(String id) async {
    await dbHelper.deleteTodo(id);
    todos.removeWhere((t) => t.id == id);
  }

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

  List<TodoModel> get doneTodos => todos.where((t) => t.isDone).toList();
  List<TodoModel> get pendingTodos => todos.where((t) => !t.isDone).toList();
}
