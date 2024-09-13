import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/services/services.dart';

import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToRidesMorning();
  goToRidesEvining();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  String? username;
  String? id;
  String? lang;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("name");
  }

  @override
  void onInit() {
    // search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.none;
    // var response = await homedata.getData();
    // // print("=============================== Controller $response ");
    // statusRequest = handilingData(response);
    // if (StatusRequest.success == statusRequest) {
    //   if (response['status'] == "success") {
    //     categories.addAll(response['categories']['data']);
    //     items.addAll(response['items']['data']);
    //     settingsdata.addAll(response['settings']['data']);
    //   } else {
    //     statusRequest = StatusRequest.failure;
    //   }
    // }
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToRidesEvining() {
    Get.toNamed(AppRoute.driverridesevining);
  }

  @override
  goToRidesMorning() {
    Get.toNamed(AppRoute.driverridesmorning);
  }
}
