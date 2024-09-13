import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/functions/handilingdata.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:bus_tracking/data/data%20source/remote/auth/logindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController password;

  bool isshowpassword = true;
  List data = [];

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      // Call the login API
      var response =
          await loginData.loginpostdata(username.text, password.text);
      print(
          "Controller Response: $response"); // Print full response for debugging

      statusRequest = handilingData(response);

      if (statusRequest == StatusRequest.success) {
        print("Full Response Data: $response");

        if (response['Message'] == 'Successfull') {
          myServices.sharedPreferences.setString("name", username.text);
          myServices.sharedPreferences.setString("password", password.text);
          print(
              "Stored Username: ${username.text}, Password: ${password.text}");

          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.homepage);
        } else {
          print("Login failed, no success message found");
          Get.defaultDialog(
              title: "Warning", middleText: "Email or Password not correct");
        }
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email or Password not correct",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {});
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  goToPageHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
