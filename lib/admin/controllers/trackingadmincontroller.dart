import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AdminTrackingController extends GetxController {
  late StatusRequest statusrequest = StatusRequest.success;
  CameraPosition? cameraPosition;
  MyServices myServices = Get.find();
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  List<Marker> markers = [];
  double? buslat = 32.0030766;
  double? buslong = 35.9376845;
  Timer? timer;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream?.cancel();
    gmc?.dispose();
    timer?.cancel();
    super.onClose();
  }

  void initialize() {
    setupMapCamera();
    startLocationUpdates();
    startLocationRefresh();
  }

  void setupMapCamera() {
    cameraPosition = CameraPosition(
      target: LatLng(buslat ?? 32.0030766, buslong ?? 35.9376845),
      zoom: 12.4746,
    );
  }

  void startLocationUpdates() {
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      if (position != null) {
        updateLocation(position);
      }
    });
  }

  void updateLocation(Position position) {
    buslat = position.latitude;
    buslong = position.longitude;

    gmc?.animateCamera(CameraUpdate.newLatLng(LatLng(buslat!, buslong!)));

    markers.removeWhere((m) => m.markerId.value == "bus");
    markers.add(Marker(
      markerId: const MarkerId("bus"),
      position: LatLng(buslat!, buslong!),
      icon: BitmapDescriptor.defaultMarker,
    ));
    update();
  }

  void startLocationRefresh() {
    timer?.cancel();

    Timer.periodic(Duration(seconds: 12), (timer) async {
      await FirebaseFirestore.instance.collection("1t").add({
        "lat": buslat,
        "long": buslong,
      });
    });
  }
}
