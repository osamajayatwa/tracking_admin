import 'package:bus_tracking/core/services/services.dart';
import 'package:bus_tracking/data/data%20source/remote/orders/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List data = [];

  // late StatusRequest statusrequest;

  MyServices myServices = Get.find();

  getData() async {
    // statusrequest = StatusRequest.loading;
    // var response = await notificationData
    //     .getData(myServices.sharedPreferences.getString("id")!);

    // print("=============================== Controller $response ");
    // statusrequest = handilingData(response);
    // if (StatusRequest.success == statusrequest) {
    //   // Start backend
    //   if (response['status'] == "success") {
    //     data.addAll(response['data']);
    //   } else {
    //     statusrequest = StatusRequest.failure;
    //   }
    //   // End
    // }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
