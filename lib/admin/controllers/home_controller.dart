import 'package:bus_tracking/admin/data/data%20source/remote/auth/home_data.dart';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class AdminHomeController extends GetxController {
  initialData();
  getdata();
  goToRidesMorning();
  goToRidesEvining();
}

class AdminHomeControllerImp extends AdminHomeController {
  MyServices myServices = Get.find();

  AdminHomeData adminhomedata = AdminHomeData(Get.find());
  late StatusRequest statusRequest;

  String? username;
  String? id;
  String? lang;

  List categories = [];
  List items = [];
  List settingsdata = [];

  @override
  initialData() {
    myServices.sharedPreferences.clear();
    lang = myServices.sharedPreferences.getString("lang");
    // username = myServices.sharedPreferences.getString("username");
    // id = myServices.sharedPreferences.getString("id");
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
    statusRequest = StatusRequest.loading;
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
    // update();
  }

  logout() {
    String userid = myServices.sharedPreferences.getString("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  @override
  goToRidesMorning() {
    Get.toNamed(
      AppRoute.adminridesmorning,
    );
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToRidesEvining() {
    Get.toNamed(
      AppRoute.adminridesevining,
    );
  }
}
