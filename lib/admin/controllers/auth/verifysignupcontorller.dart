import 'package:bus_tracking/admin/data/data%20source/remote/auth/verifysignup.dart';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class AdminVerifySignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verifycodeSignup);
}

class AdminVerifySignUpControllerImp extends AdminVerifySignUpController {
  AdminVerifySignUpData verifySignUpData = AdminVerifySignUpData(Get.find());
  String? email;
  StatusRequest statusrequest = StatusRequest.none;

  @override
  checkcode() {}

  @override
  goToSuccessSignUp(verifycodeSignup) async {
    // statusrequest = StatusRequest.loading;
    // update();
    // var response =
    //     await verifySignUpData.postverifydata(email!, verifycodeSignup);
    // statusrequest = handilingData(response);
    // if (StatusRequest.success == statusrequest) {
    //   // if (response['status'] == "success") {
    Get.offNamed(AppRoute.adminsuccessSignUp);
    // } else {
    //   Get.defaultDialog(
    //       title: "Warning", middleText: "Verify Code Not Correct");
    //   statusrequest = StatusRequest.failure;
    // }
    // //}
    // update();
  }

  @override
  void onInit() {
    // email = Get.arguments['email'];
    super.onInit();
  }

  reSend() {
    verifySignUpData.resendData(email!);
  }
}
