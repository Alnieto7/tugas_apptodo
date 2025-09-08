import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  void changeIndex(int i) => currentIndex.value = i;
}
