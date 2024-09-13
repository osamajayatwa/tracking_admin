import 'package:bus_tracking/admin/controllers/home_controller.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/imageassests.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/view/widget/home/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminCustomCardHome extends GetView<AdminHomeControllerImp> {
  final String title;
  final String body;
  const AdminCustomCardHome(
      {super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 240,
      child: Center(
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            height: 200,
            width: Get.width / 1,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: ListView(
              children: [
                CustomAppBar(
                  titleappbar: 'Admin',
                  onPressedIconNotefication: () {
                    Get.toNamed(AppRoute.notification);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            width: Get.width,
            top: 95,
            right: controller.lang == "en" ? 10 : null,
            left: controller.lang == "ar" ? 10 : null,
            child: Row(
              children: [
                Container(
                  width: 210,
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: ListTile(
                    title: Text(title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    subtitle: Text(body,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                Container(
                  height: 120,
                  width: 130,
                  decoration: BoxDecoration(
                      color: AppColor.backgroundcolor,
                      borderRadius: BorderRadius.circular(160)),
                  child: Image.asset(
                    ImageAssest.logo,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
