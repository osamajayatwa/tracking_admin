import 'package:bus_tracking/admin/data/data%20source/remote/auth/signupdata.dart';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

abstract class AdminSignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class AdminSignUpControllerImp extends AdminSignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  bool isshowpaas = true;

  StatusRequest statusRequest = StatusRequest.none;

  AdminSignupData signupData = AdminSignupData(Get.find());
  showpass() {
    isshowpaas = isshowpaas == true ? false : true;
    update();
  }

  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      // statusRequest = StatusRequest.loading;
      // update();
      // var response = await signupData.postdata(
      //     username.text, email.text, password.text, phone.text);
      // print("=============================== Controller $response ");
      // statusRequest = handilingData(response);
      // if (StatusRequest.success == statusRequest) {
      //   if (response['status'] == "success") {
      //     // data.addAll(response['data']);
      Get.offNamed(AppRoute.adminverfiyCodeSignUp);
      //         arguments: {"email": email.text});
      //   } else {
      //     Get.defaultDialog(
      //         title: "ُWarning",
      //         middleText: "Phone Number Or Email Already Exists");
      //     statusRequest = StatusRequest.failure;
      //   }
      // }
      // update();
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.adminlogin);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
