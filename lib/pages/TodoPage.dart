import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/controllers/AddTodoController.dart';
import '../component/custom_button.dart';
import '../component/custom_textfield.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addC = Get.put(AddTodoController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(addC.isEdit.value ? "Edit Todo" : "Tambah Todo")),
        backgroundColor: AppColors.primary,
        actions: [
          Obx(() {
            if (addC.isEdit.value && addC.todoId != null) {
              return IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: addC.deleteTodo,
              );
            }
            return const SizedBox();
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(label: "Judul", controller: addC.titleC),
            const SizedBox(height: 12),
            CustomTextField(label: "Deskripsi", controller: addC.descC),
            const SizedBox(height: 12),

            Obx(
              () => DropdownButtonFormField<String>(
                value: addC.selectedCategory.value,
                items: const [
                  DropdownMenuItem(value: "Sekolah", child: Text("Sekolah")),
                  DropdownMenuItem(
                    value: "Pekerjaan",
                    child: Text("Pekerjaan"),
                  ),
                  DropdownMenuItem(value: "Pribadi", child: Text("Pribadi")),
                ],
                onChanged: (value) => addC.selectedCategory.value = value!,
                decoration: InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Obx(
              () => ListTile(
                leading: const Icon(
                  Icons.calendar_today,
                  color: AppColors.primary,
                ),
                title: Text("Tanggal: ${addC.selectedDate.value}"),
                onTap: () => addC.pickDate(context),
              ),
            ),

            Obx(
              () => ListTile(
                leading: const Icon(
                  Icons.access_time,
                  color: AppColors.primary,
                ),
                title: Text("Jam: ${addC.selectedTime.value}"),
                onTap: () => addC.pickTime(context),
              ),
            ),

            const SizedBox(height: 20),
            Obx(
              () => CustomButton(
                text: addC.isEdit.value ? "Update" : "Simpan",
                isPrimary: !addC.isEdit.value,
                onPressed: addC.saveOrUpdate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
