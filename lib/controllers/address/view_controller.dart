import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/functions/handilingdata.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:bus_tracking/data/data%20source/remote/address_data.dart';
import 'package:bus_tracking/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusrequest;

  MyServices myServices = Get.find();

  deleteAddress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusrequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id").toString());

    print("=============================== Controller $response ");

    statusrequest = handilingData(response);

    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusrequest = StatusRequest.failure;
        }
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
