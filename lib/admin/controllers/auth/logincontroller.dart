import 'package:bus_tracking/admin/data/data%20source/remote/auth/logindata.dart';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AdminLoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class AdminLoginControllerImp extends AdminLoginController {
  AdminLoginData loginData = AdminLoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
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
    statusRequest = StatusRequest.loading;

    Get.offNamed(AppRoute.adminhomepage);

    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.adminsignup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.adminforgetpass);
    update();
  }

  goToPageHome() {
    Get.offNamed(AppRoute.adminhomepage);
    update();
  }
}
