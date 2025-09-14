import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import '../component/custom_button.dart';
import '../component/custom_textfield.dart';
import '../controllers/TodoController.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();
  String selectedCategory = "Sekolah";

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Todo"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(label: "Judul", controller: titleC),
            const SizedBox(height: 12),
            CustomTextField(label: "Deskripsi", controller: descC),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: const [
                DropdownMenuItem(value: "Sekolah", child: Text("Sekolah")),
                DropdownMenuItem(value: "Pekerjaan", child: Text("Pekerjaan")),
                DropdownMenuItem(value: "Pribadi", child: Text("Pribadi")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Kategori",
                labelStyle: const TextStyle(color: AppColors.secondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Simpan",
              onPressed: () {
                if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
                  todoController.addTodo(
                    titleC.text,
                    descC.text,
                    selectedCategory,
                  );
                  Get.back();
                } else {
                  Get.snackbar("Error", "Judul dan Deskripsi harus diisi",
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
