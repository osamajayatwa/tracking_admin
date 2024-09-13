import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class AdminVerifyLoginController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verifycodeSignup);
}

class AdminVerifyLoginControllerImp extends AdminVerifyLoginController {
  //VerifySignUpData verifySignUpData = VerifySignUpData(Get.find());
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
    Get.offNamed(AppRoute.adminsuccesslogin);
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
    // verifySignUpData.resendData(email!);
  }
}
