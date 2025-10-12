import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tugas_apptodo/controllers/AuthController.dart';
import 'package:tugas_apptodo/controllers/TodoController.dart';
import 'package:tugas_apptodo/pages/login/LoginMobile.dart';
import 'package:tugas_apptodo/pages/login/LoginWide.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

   final todoC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: LayoutBuilder(
        builder: (context, Constraints) {
          todoC.updateLayout(Constraints);
          return Obx(()=> todoC.isMobile.value ? LoginMobile() : LoginWide());
        },
       )
    );
  }
}