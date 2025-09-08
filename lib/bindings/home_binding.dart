import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/HomeController.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
