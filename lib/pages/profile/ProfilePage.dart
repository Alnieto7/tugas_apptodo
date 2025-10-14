import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_apptodo/controllers/ProfileController.dart';
import 'package:tugas_apptodo/pages/profile/ProfilMobile.dart';
import 'package:tugas_apptodo/pages/profile/ProfileWide.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

   final todoc = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: LayoutBuilder(
        builder: (context, Constraints) {
          todoc.updateLayout(Constraints);
          return Obx(()=> todoc.isMobile.value ? ProfileMobile() : ProfileWide());
        },
       )
    );
  }
}