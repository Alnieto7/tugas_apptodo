import 'package:get/get.dart';

class AuthController extends GetxController {
  var Loginpage = false.obs;

  void login(String username, String password) {
    if (username == "admin" && password == "1234") {
      Loginpage.value = true;
      Get.offAllNamed('/dashboard');
    } else {
      Get.snackbar("Login Gagal", "Username atau password salah");
    }
  }
}
