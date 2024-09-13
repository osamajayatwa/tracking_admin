import 'package:bus_tracking/admin/controllers/home_controller.dart';
import 'package:bus_tracking/view/widget/customcardhome.dart';
import 'package:bus_tracking/view/widget/drawer.dart';
import 'package:bus_tracking/view/widget/home/customtitlehome.dart';
import 'package:bus_tracking/admin/widget/listridesadminhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeControllerImp());
    return GetBuilder<AdminHomeControllerImp>(
        builder: (controller) => Scaffold(
              body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      // HandilingDataView(
                      //     statusrequest: controller.statusRequest,
                      //     widget: Column(

                      const AdminCustomCardHome(
                          title: "Alsanabel", body: "School"),
                      const CustomTitleHome(title: "Rides"),
                      const SizedBox(
                        height: 10,
                      ),
                      ListAdminRidesHome()
                    ],
                  )),
              drawer: Drawer(
                child: CustomDrawer(),
              ),
            ));
  }
}
