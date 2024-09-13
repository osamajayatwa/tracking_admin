import 'package:bus_tracking/controllers/trackingcontroller.dart';
import 'package:bus_tracking/core/class/handilingdataview.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());

    // Ensure that the arguments (index) are not null
    final int? childIndex = Get.arguments as int?; // Allow null here

    if (childIndex == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text(
            'Child index not provided!',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Tracking'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TrackingController>(
          builder: ((controller) => HandilingDataView(
              statusrequest: controller.statusRequest,
              widget: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.gmc = controllermap;
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 85,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.red.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15)),
                            child: MaterialButton(
                              onPressed: () async {
                                // Ensure current location is available before launching Google Maps
                                if (controller.destLat != null &&
                                    controller.destLong != null) {
                                  final googleMapsUrl =
                                      'https://www.google.com/maps/search/?api=1&query=${controller.destLat},${controller.destLong}';
                                  if (await canLaunch(googleMapsUrl)) {
                                    await launch(googleMapsUrl);
                                  } else {
                                    throw 'Could not open Google Maps';
                                  }
                                } else {
                                  Get.snackbar('Error',
                                      'Current location is not available.');
                                }
                              },
                              child: Text(
                                "Show in Google Maps",
                                style:
                                    TextStyle(color: AppColor.backgroundcolor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.red,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Get.back(result: childIndex);
                      },
                      child: Text(
                        "End",
                        style: TextStyle(color: AppColor.backgroundcolor),
                      ),
                    ),
                  ),
                ],
              ))),
        ),
      ),
    );
  }
}
