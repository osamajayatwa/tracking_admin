import 'package:bus_tracking/admin/controllers/auth/signupcontroller.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AdminSuccessSignUp extends StatelessWidget {
  const AdminSuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AdminSignUpControllerImp controller = Get.put(AdminSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            '32'.tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColor.grey,
                ),
          )),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
            Text(
              "28".tr,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomBottunAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToSignIn();
                },
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
