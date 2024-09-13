import 'package:bus_tracking/controllers/auth/logincontroller.dart';
import 'package:bus_tracking/core/class/handilingdataview.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/functions/alertexitapp.dart';
import 'package:bus_tracking/core/functions/validinput.dart';
import 'package:bus_tracking/view/widget/auth/costumlogintextC.dart';
import 'package:bus_tracking/view/widget/auth/custombuttonauth.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextA.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextB.dart';
import 'package:bus_tracking/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            title: Text(
              '15'.tr,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.grey,
                  ),
            )),
        body: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandilingDataRequest(
              statusrequest: controller.statusRequest,
              widget: PopScope(
                canPop: false,
                onPopInvoked: (bool didpop) {
                  if (didpop) {
                    return;
                  }
                  alertExitApp();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 35),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const LogoAuth(),
                          const SizedBox(
                            height: 10,
                          ),
                          CostumTextTitle(
                            text: "10".tr,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextBody(text: "11".tr),
                          const SizedBox(
                            height: 40,
                          ),
                          CostumTextForm(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 1, 100, "email");
                            },
                            mycontroller: controller.username,
                            labeltext: "18".tr,
                            hinttext: "12".tr,
                            icondata: Icons.email_outlined,
                            obscure: false,
                          ),
                          const SizedBox(height: 20),
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => CostumTextForm(
                              obscure: controller.isshowpassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 1, 20, "password");
                              },
                              mycontroller: controller.password,
                              labeltext: "19".tr,
                              hinttext: "13".tr,
                              icondata: Icons.lock_outlined,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomBottunAuth(
                            text: "15".tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    )),
              )),
        ));
  }
}
