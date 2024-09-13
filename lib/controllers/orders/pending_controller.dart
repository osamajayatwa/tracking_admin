import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/functions/handilingdata.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:bus_tracking/data/data%20source/remote/orders/pending_data.dart';
import 'package:bus_tracking/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];
  late OrdersModel ordersModel;
  late StatusRequest statusrequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    update();
    statusrequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteOrder(
    String orderid,
  ) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.deleteData(orderid);
    print("=============================== Controller $response ");
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
