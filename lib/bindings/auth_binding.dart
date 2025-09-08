import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/AuthController.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
