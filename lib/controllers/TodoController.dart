import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final todos = <TodoModel>[].obs;

  void addTodo(String title, String description, String category) {
    final todo = TodoModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
      category: category,
    );
    todos.insert(0, todo);
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
      );
    }
  }

  void deleteTodo(String id) {
    todos.removeWhere((t) => t.id == id);
  }

  List<TodoModel> get doneTodos => todos.where((t) => t.isDone).toList();
  List<TodoModel> get pendingTodos => todos.where((t) => !t.isDone).toList();
}
