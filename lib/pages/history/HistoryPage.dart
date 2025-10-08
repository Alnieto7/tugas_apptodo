import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';
import 'package:tugas_apptodo/pages/history/HistoryMobile.dart';
import 'package:tugas_apptodo/pages/history/HistoryWide.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final todoC = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, Constraints) {
          todoC.updateLayout(Constraints);
          return Obx(
            () => todoC.isMobile.value ? HistoryMobile() : HistoryWide(),
          );
        },
      ),
    );
  }
}
