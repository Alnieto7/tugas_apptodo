import 'package:get/get.dart';
import 'package:tugas_apptodo/bindings/Splashscreen_Binding.dart';
import 'package:tugas_apptodo/pages/DashboardPage.dart';
import 'package:tugas_apptodo/pages/home/HomeMobile.dart';
import 'package:tugas_apptodo/pages/LoginPage.dart';
import 'package:tugas_apptodo/pages/Splashscreen.dart';
import 'package:tugas_apptodo/pages/TodoPage.dart';
import 'package:tugas_apptodo/pages/home/HomePage.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import '../bindings/auth_binding.dart';
import '../bindings/home_binding.dart';


class AppPages {
static final pages = [
GetPage(name: AppRoutes.splashscreen, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: AuthBinding()),
GetPage(name: AppRoutes.dashboard, page: () => DashboardPage(), binding: HomeBinding()),
GetPage(name: AppRoutes.addtodo, page: () => AddTodoPage(), binding: HomeBinding()),
GetPage(name: AppRoutes.home, page: () => Homepage(), binding: HomeBinding()),
];
}