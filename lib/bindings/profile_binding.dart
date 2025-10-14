import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/ProfileController.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
