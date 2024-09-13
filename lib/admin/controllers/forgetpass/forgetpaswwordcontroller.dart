import 'package:bus_tracking/admin/data/data%20source/remote/forgetpass/checkemail.dart';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class AdminForgetPasswordController extends GetxController {
  checkEmail();
}

class AdminForgetPasswordControllerImp extends AdminForgetPasswordController {
  AdminCheckEmailData checkEmailData = AdminCheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusrequest = StatusRequest.none;

  late TextEditingController email;

  List data = [];

  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      // statusrequest = StatusRequest.loading;
      // update();
      // var response = await checkEmailData.loginpostdata(
      //   email.text,
      // );

      // statusrequest = handilingData(response);
      // if (StatusRequest.success == statusrequest) {
      //   if (response['status'] == "success") {
      //     data.addAll(response['data']);
      Get.offNamed(AppRoute.adminverfiyCode);
      //, arguments: {"email": email.text});
      //   } else {
      //     Get.defaultDialog(title: "Warning", middleText: "Email Not Found");
      //     statusrequest = StatusRequest.failure;
      //   }
      // }
      // update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
