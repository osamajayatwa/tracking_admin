import 'package:bus_tracking/core/constant/routes.dart';

import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToAdminLoginPage();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToAdminLoginPage() {
    Get.offAllNamed(AppRoute.adminlogin);
  }
}
