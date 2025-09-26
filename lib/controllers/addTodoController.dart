import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'TodoController.dart';

class AddTodoController extends GetxController {
  // Controller untuk form
  final titleC = TextEditingController();
  final descC = TextEditingController();

  // State
  var selectedCategory = "Sekolah".obs;
  var selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  var selectedTime = DateFormat('HH:mm').format(DateTime.now()).obs;

  var isEdit = false.obs;
  String? todoId;

  final todoC = Get.find<TodoController>();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null) {
      isEdit.value = args["isEdit"] ?? false;
      todoId = args["todoId"];
      titleC.text = args["title"] ?? "";
      descC.text = args["description"] ?? "";
      selectedCategory.value = args["category"] ?? "Sekolah";
      selectedDate.value = args["date"] ?? selectedDate.value;
      selectedTime.value = args["time"] ?? selectedTime.value;
    }
  }

  // Pick date
  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate.value = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  // Pick time
  Future<void> pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final dt = DateTime(0, 0, 0, picked.hour, picked.minute);
      selectedTime.value = DateFormat('HH:mm').format(dt);
    }
  }

  // Simpan / update
  void saveOrUpdate() {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      if (isEdit.value && todoId != null) {
        todoC.editTodo(
          todoId!,
          titleC.text,
          descC.text,
          selectedCategory.value,
          selectedDate.value,
          selectedTime.value,
        );
      } else {
        todoC.addTodo(
          titleC.text,
          descC.text,
          selectedCategory.value,
          selectedDate.value,
          selectedTime.value,
        );
        Get.back();
        Get.snackbar("Sukses", "Todo berhasil ditambahkan",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Error", "Judul dan Deskripsi harus diisi",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Hapus todo
  void deleteTodo() {
    if (todoId != null) {
      todoC.deleteTodo(todoId!);
      Get.back();
    }
  }
}
