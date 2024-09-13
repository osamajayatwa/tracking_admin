import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDriverRidesEvening extends StatelessWidget {
  ListDriverRidesEvening({super.key});

  final List<Map<String, dynamic>> rides = [
    {
      'name': 'Ride One',
      'start': DateTime(2024, 9, 12, 00, 0),
      'end': DateTime(2024, 9, 12, 19, 0),
      'time': '18:00 - 19:00',
    },
    {
      'name': 'Ride Two',
      'start': DateTime(2024, 9, 12, 19, 0),
      'end': DateTime(2024, 9, 12, 20, 0),
      'time': '19:00 - 20:00',
    },
    {
      'name': 'Ride Three',
      'start': DateTime(2024, 9, 12, 20, 0),
      'end': DateTime(2024, 9, 12, 21, 0),
      'time': '20:00 - 21:00',
    },
  ];

  bool isRideActive(DateTime start, DateTime end) {
    final now = DateTime.now();
    return now.isAfter(start) && now.isBefore(end);
  }

  bool isRideStarted(DateTime start, DateTime end) {
    final now = DateTime.now();
    return now.isAfter(start) && now.isBefore(end);
  }

  @override
  Widget build(BuildContext context) {
    final filteredRides =
        rides.where((ride) => DateTime.now().isBefore(ride['end'])).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Evening Rides"),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      body: filteredRides.isEmpty
          ? Center(
              child: Text(
                "No Rides For Today",
                style: TextStyle(fontSize: 18, color: AppColor.primaryColor),
              ),
            )
          : ListView.builder(
              itemCount: filteredRides.length,
              itemBuilder: (context, index) {
                final ride = filteredRides[index];
                final isActive = isRideActive(ride['start'], ride['end']);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: isActive
                        ? () {
                            Get.toNamed(AppRoute.listchildrenoftheride);
                          }
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "You can't start ${ride['name'] ?? 'this ride'} "),
                              ),
                            );
                          },
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: AppColor.primaryColor),
                              color: isActive
                                  ? AppColor.backgroundcolor.withOpacity(0.2)
                                  : AppColor.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            height: 100,
                            width: 360,
                          ),
                          Positioned(
                            top: 10,
                            left: 135,
                            child: Text(
                              ride['name'] ?? 'Unknown Ride',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: const Text(
                              "Time",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.red,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: Text(
                              ride['time'] ?? 'Unknown Time',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColor.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
