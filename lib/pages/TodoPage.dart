import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';   // 🆕 ini yang belum ada
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';
import '../component/custom_button.dart';
import '../component/custom_textfield.dart';



class AddTodoPage extends StatefulWidget {
  final bool isEdit;
  final String? todoId;
  final String? title;
  final String? description;
  final String? category;
  final String? date;
  final String? time;

  const AddTodoPage({
    super.key,
    this.isEdit = false,
    this.todoId,
    this.title,
    this.description,
    this.category,
    this.date,
    this.time,
  });

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();
  String selectedCategory = "Sekolah";
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String selectedTime = DateFormat('HH:mm').format(DateTime.now());

  final todoC = Get.find<TodoController>();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      titleC.text = widget.title ?? "";
      descC.text = widget.description ?? "";
      selectedCategory = widget.category ?? "Sekolah";
      selectedDate = widget.date ?? selectedDate;
      selectedTime = widget.time ?? selectedTime;
    }
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final dt = DateTime(0, 0, 0, picked.hour, picked.minute);
      setState(() {
        selectedTime = DateFormat('HH:mm').format(dt);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "Edit Todo" : "Tambah Todo"),
        backgroundColor: AppColors.primary,
        actions: [
          if (widget.isEdit && widget.todoId != null)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                todoC.deleteTodo(widget.todoId!);
                Get.back();
              },
            ),
        ],
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Input tanggal
            ListTile(
              leading: const Icon(Icons.calendar_today, color: AppColors.primary),
              title: Text("Tanggal: $selectedDate"),
              onTap: pickDate,
            ),

            // Input jam
            ListTile(
              leading: const Icon(Icons.access_time, color: AppColors.primary),
              title: Text("Jam: $selectedTime"),
              onTap: pickTime,
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: widget.isEdit ? "Update" : "Simpan",
              isPrimary: widget.isEdit ? false : true,
              onPressed: () {
                if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
                  if (widget.isEdit && widget.todoId != null) {
                    todoC.editTodo(
                      widget.todoId!,
                      titleC.text,
                      descC.text,
                      selectedCategory,
                      selectedDate,
                      selectedTime,
                    );
                  } else {
                    todoC.addTodo(
                      titleC.text,
                      descC.text,
                      selectedCategory,
                      selectedDate,
                      selectedTime,
                    );
                  }
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
