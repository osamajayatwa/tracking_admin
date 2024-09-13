import 'package:bus_tracking/controllers/forgetpass/forgetpaswwordcontroller.dart';
import 'package:bus_tracking/core/class/handilingdataview.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/functions/validinput.dart';
import 'package:bus_tracking/view/widget/auth/costumlogintextC.dart';
import 'package:bus_tracking/view/widget/auth/custombuttonauth.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextA.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextB.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            title: Text(
              '14'.tr,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.grey,
                  ),
            )),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandilingDataRequest(
              statusrequest: controller.statusrequest,
              widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CostumTextTitle(
                          text: "27".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBody(text: "29".tr),
                        const SizedBox(
                          height: 40,
                        ),
                        CostumTextForm(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 20, "email");
                          },
                          mycontroller: controller.email,
                          labeltext: "18".tr,
                          hinttext: "12".tr,
                          icondata: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        CustomBottunAuth(
                          text: "30".tr,
                          onPressed: () {
                            controller.checkEmail();
                          },
                        ),
                      ],
                    ),
                  ))),
        ));
  }
}
