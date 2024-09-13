import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRidesEvining extends StatelessWidget {
  const ListRidesEvining({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 20,
        ),
        ListTile(
            title: Text(
          "Evining Rides",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        )),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                        top: BorderSide(width: 3, color: AppColor.primaryColor),
                        left:
                            BorderSide(width: 1, color: AppColor.primaryColor),
                        right:
                            BorderSide(width: 1, color: AppColor.primaryColor),
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor)),
                    color: AppColor.backgroundcolor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  height: 100,
                  width: 360,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 135),
                  child: Text(
                    textAlign: TextAlign.right,
                    "Ride one",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 159,
                  child: Text(
                    "Time",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Text(
                    "1.00-2.00",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Text(
                    "driver 1",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoute.tracking);
          },
          child: Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                        top: BorderSide(width: 3, color: AppColor.primaryColor),
                        left:
                            BorderSide(width: 1, color: AppColor.primaryColor),
                        right:
                            BorderSide(width: 1, color: AppColor.primaryColor),
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor)),
                    color: AppColor.backgroundcolor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  height: 100,
                  width: 360,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 135),
                  child: Text(
                    textAlign: TextAlign.right,
                    "Ride tow",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 159,
                  child: Text(
                    "Time",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Text(
                    "2.00-1.00",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Text(
                    "driver 1",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}
