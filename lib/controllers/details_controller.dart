import 'dart:async';

import 'package:bus_tracking/admin/data/model/ordersmodel.dart';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  StatusRequest statusrequest = StatusRequest.success;

  late OrdersModel ordersModel;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;

  intialData() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusrequest = StatusRequest.loading;

    if (StatusRequest.success == statusrequest) {}
    update();
  }
}
