import 'package:bus_tracking/admin/controllers/auth/signupcontroller.dart';
import 'package:bus_tracking/core/class/handilingdataview.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/functions/alertexitapp.dart';
import 'package:bus_tracking/core/functions/validinput.dart';
import 'package:bus_tracking/view/widget/auth/costumlogintextC.dart';
import 'package:bus_tracking/view/widget/auth/costumtextsignup.dart';
import 'package:bus_tracking/view/widget/auth/custombuttonauth.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextA.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextB.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AdminSignUp extends StatelessWidget {
  const AdminSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            title: Text(
              '17'.tr,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.grey,
                  ),
            )),
        body: PopScope(
            canPop: false,
            onPopInvoked: (bool didpop) {
              if (didpop) {
                return;
              }
              alertExitApp();
            },
            child: GetBuilder<AdminSignUpControllerImp>(
                builder: (controller) => HandilingDataRequest(
                      statusrequest: controller.statusRequest,
                      widget: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          child: Form(
                            key: controller.formstate,
                            child: ListView(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                CostumTextTitle(
                                  text: "17".tr,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextBody(text: "24".tr),
                                const SizedBox(
                                  height: 40,
                                ),
                                CostumTextForm(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 3, 20, "username");
                                  },
                                  mycontroller: controller.username,
                                  labeltext: "20".tr,
                                  hinttext: "23".tr,
                                  icondata: Icons.person_outlined,
                                ),
                                const SizedBox(height: 20),
                                CostumTextForm(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 40, "email");
                                  },
                                  mycontroller: controller.email,
                                  labeltext: "18".tr,
                                  hinttext: "12".tr,
                                  icondata: Icons.email_outlined,
                                ),
                                const SizedBox(height: 20),
                                CostumTextForm(
                                  isNumber: true,
                                  valid: (val) {
                                    return validInput(val!, 7, 10, "phone");
                                  },
                                  mycontroller: controller.phone,
                                  labeltext: "21".tr,
                                  hinttext: "22".tr,
                                  icondata: Icons.phone_outlined,
                                ),
                                const SizedBox(height: 20),
                                GetBuilder<AdminSignUpControllerImp>(
                                    builder: (controller) => CostumTextForm(
                                          obscure: controller.isshowpaas,
                                          onTapIcon: () {
                                            controller.showpass();
                                          },
                                          isNumber: false,
                                          valid: (val) {
                                            return validInput(
                                                val!, 5, 30, "password");
                                          },
                                          mycontroller: controller.password,
                                          labeltext: "19".tr,
                                          hinttext: "13".tr,
                                          icondata: Icons.lock_outlined,
                                        )),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomBottunAuth(
                                  text: "17".tr,
                                  onPressed: () {
                                    controller.signUp();
                                  },
                                ),
                                const SizedBox(height: 30),
                                CostumSignUp(
                                  textone: "25".tr,
                                  texttow: "15".tr,
                                  onTap: () {
                                    controller.goToSignIn();
                                  },
                                )
                              ],
                            ),
                          )),
                    ))));
  }
}
