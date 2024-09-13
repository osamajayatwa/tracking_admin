import 'package:bus_tracking/admin/controllers/forgetpass/resetpasscontroller.dart';
import 'package:bus_tracking/core/class/handilingdataview.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/functions/validinput.dart';
import 'package:bus_tracking/view/widget/auth/costumlogintextC.dart';
import 'package:bus_tracking/view/widget/auth/custombuttonauth.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextA.dart';
import 'package:bus_tracking/view/widget/auth/customloginTextB.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminResetPassword extends StatelessWidget {
  const AdminResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            title: Text(
              'Reset Password',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.grey,
                  ),
            )),
        body: GetBuilder<AdminResetPasswordControllerImp>(
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
                        const CostumTextTitle(
                          text: "35",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextBody(text: "34"),
                        const SizedBox(
                          height: 40,
                        ),
                        CostumTextForm(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 20, "password");
                          },
                          mycontroller: controller.password,
                          labeltext: "35".tr,
                          hinttext: "34".tr,
                          icondata: Icons.lock_outlined,
                        ),
                        CostumTextForm(
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 5, 40, "password");
                          },
                          mycontroller: controller.repassword,
                          hinttext: "Re" + " " + "13".tr,
                          icondata: Icons.lock_outline,
                          labeltext: "19".tr,
                          // mycontroller: ,
                        ),
                        const SizedBox(height: 20),
                        CustomBottunAuth(
                          text: "33".tr,
                          onPressed: () {
                            controller.resetpass();
                          },
                        ),
                      ],
                    ),
                  ))),
        ));
  }
}
