import 'dart:async';
import 'package:bus_tracking/core/class/statusrequest.dart';
import 'package:bus_tracking/core/functions/getdecodepoly.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  late StatusRequest statusRequest = StatusRequest.success;
  CameraPosition? cameraPosition;
  MyServices myServices = Get.find();
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  List<Marker> markers = [];
  double? destLat = 32.0030766;
  double? destLong = 35.9376845;
  double? currentLat;
  double? currentLong;
  Timer? firebaseUpdateTimer;

  @override
  void onInit() {
    initPolyline();
    getCurrentLocation();
    startLocationRefresh();
    super.onInit();
  }

  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(destLat!, destLong!),
      zoom: 12.4746,
    );

    addMarker("dest", LatLng(destLat!, destLong!));

    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      if (position != null) {
        currentLat = position.latitude;
        currentLong = position.longitude;
        updateMarkerPosition(currentLat!, currentLong!);
        animateCameraToCurrentPosition();
        update();
      }
    });
  }

  updateMarkerPosition(double latitude, double longitude) {
    markers.removeWhere((marker) => marker.markerId.value == "current");
    addMarker("current", LatLng(latitude, longitude));
  }

  addMarker(String id, LatLng position) {
    markers.add(Marker(markerId: MarkerId(id), position: position));
  }

  animateCameraToCurrentPosition() {
    if (gmc != null && currentLat != null && currentLong != null) {
      gmc!.animateCamera(
        CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)),
      );
    }
  }

  startLocationRefresh() {
    firebaseUpdateTimer = Timer.periodic(Duration(seconds: 12), (timer) {
      if (hasValidCoordinates()) {
        FirebaseFirestore.instance.collection("1t").doc().set({
          "lat": currentLat,
          "long": currentLong,
        });
      }
    });
  }

  initPolyline() async {
    if (hasValidCoordinates()) {
      await showPolyline(currentLat!, currentLong!, destLat!, destLong!);
    } else {
      print("Coordinates are not available to draw the polyline.");
    }
  }

  bool hasValidCoordinates() {
    return currentLat != null &&
        currentLong != null &&
        destLat != null &&
        destLong != null;
  }

  @override
  void onClose() {
    positionStream?.cancel();
    gmc?.dispose();
    firebaseUpdateTimer?.cancel();
    super.onClose();
  }
}
