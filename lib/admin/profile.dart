import 'package:bus_tracking/admin/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeControllerImp());
    return GetBuilder<AdminHomeControllerImp>(
        builder: (controller) => const Scaffold(
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Hello")],
              )),
            ));
  }
}
