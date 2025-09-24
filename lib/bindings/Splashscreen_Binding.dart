import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/Splashscreen_Controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}