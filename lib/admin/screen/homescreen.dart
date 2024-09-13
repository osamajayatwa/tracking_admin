import 'package:bus_tracking/admin/controllers/homescreen_controller.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/functions/alertexitapp.dart';
import 'package:bus_tracking/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeScreenControllerImp());
    return GetBuilder<AdminHomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) async {
                  alertExitApp();
                },
                child: controller.listPage.elementAt(controller.currentpage),
              ),
            ));
  }
}
