import 'package:bus_tracking/core/constant/routes.dart';

import 'package:get/get.dart';

abstract class AdminSuccessResetPasswordController extends GetxController {
  goToPageLoginAdmin();
}

class AdminSuccessResetPasswordControllerImp
    extends AdminSuccessResetPasswordController {
  @override
  goToPageLoginAdmin() {
    Get.offAllNamed(AppRoute.adminlogin);
  }
}
