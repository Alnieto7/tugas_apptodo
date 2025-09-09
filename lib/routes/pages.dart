import 'package:get/get.dart';
import 'package:tugas_apptodo/pages/DashboardPage.dart';
import 'package:tugas_apptodo/pages/HomePage.dart';
import 'package:tugas_apptodo/pages/LoginPage.dart';
import 'package:tugas_apptodo/pages/TodoPage.dart';
import 'package:tugas_apptodo/routes/routes.dart';
import '../bindings/auth_binding.dart';
import '../bindings/home_binding.dart';


class AppPages {
static final pages = [
GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: AuthBinding()),
GetPage(name: Routes.DASHBOARD, page: () => DashboardPage(), binding: HomeBinding()),
GetPage(name: Routes.ADD_TODO, page: () => AddTodoPage(), binding: HomeBinding()),
GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
];
}