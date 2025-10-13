import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tugas_apptodo/controllers/ProfileController.dart';
import 'package:tugas_apptodo/pages/profile/ProfilMobile.dart';
import 'package:tugas_apptodo/pages/profile/ProfileWide.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

    final todoC = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: LayoutBuilder(
        builder: (context, Constraints) {
          todoC.updateLayout(Constraints);
          return Obx(()=> todoC.isMobile.value ? ProfileMobile() : ProfileWide());
        },
       )
    );
  }
}