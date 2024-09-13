import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/functions/handilingdata.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:bus_tracking/data/data%20source/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusrequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addAddress() async {
    statusrequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);

    statusrequest = handilingData(response);

    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "Address Added Successfully");
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
