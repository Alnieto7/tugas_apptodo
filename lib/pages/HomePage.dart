import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tugas_apptodo/color/app_colors.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';
import 'package:tugas_apptodo/pages/TodoPage.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import '../component/custom_card.dart';


class HomePage extends StatelessWidget {
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Obx(() {
        final list = todoController.pendingTodos;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final todo = list[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.category),
              trailing: IconButton(
              icon: Icon(Icons.check),
              onPressed: () => todoController.toggleDone(todo.id),
          ));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addtodo),
        child: Icon(Icons.add),
      ),
    );
  }
}
