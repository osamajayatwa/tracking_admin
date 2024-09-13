import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/data/data%20source/remote/forgetpass/verifycodedata.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkcode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeForgetPassData verifyCodeForgetPassData =
      VerifyCodeForgetPassData(Get.find());
  StatusRequest statusrequest = StatusRequest.none;
  String? email;
  @override
  checkcode() {}
  @override
  goToResetPassword(verifycode) async {
    // statusrequest = StatusRequest.loading;
    // update();
    // var response =
    //     await verifyCodeForgetPassData.forgetdata(email!, verifycode);
    // statusrequest = handilingData(response);
    // if (StatusRequest.success == statusrequest) {
    //   if (response['status'] == "success") {
    Get.offNamed(AppRoute.resetPassword);
    //   } else {
    //     Get.defaultDialog(
    //         title: "Warning", middleText: "Verify Code Not Correct");
    //     statusrequest = StatusRequest.failure;
    //   }
    // }
    // update();
  }

  @override
  void onInit() {
    // email = Get.arguments['email'];
    super.onInit();
  }
}
