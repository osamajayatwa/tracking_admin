import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/functions/ridesalert.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRides extends StatelessWidget {
  const ListRides({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isClickable = isWithinTimeRange();
    final bool isClickable2 = isWithinTimeRange2();

    return ListView(children: [
      ListTile(
          title: Text(
        "Rides",
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
        onTap: () {
          if (isClickable) {
            Get.toNamed(AppRoute.childlocation);
          } else {
            showAlertDialog(context);
          }
        },
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: const Border(
                      top:
                          BorderSide(width: 3, color: AppColor.backgroundcolor),
                      left:
                          BorderSide(width: 1, color: AppColor.backgroundcolor),
                      right:
                          BorderSide(width: 1, color: AppColor.backgroundcolor),
                      bottom: BorderSide(
                          width: 3, color: AppColor.backgroundcolor)),
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
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
                left: 15,
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
                  " 6.00 - 7.30  am",
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
      SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          if (isClickable2) {
            Get.toNamed(AppRoute.childlocation);
          } else {
            showAlertDialog2(context);
          }
        },
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: const Border(
                      top:
                          BorderSide(width: 3, color: AppColor.backgroundcolor),
                      left:
                          BorderSide(width: 1, color: AppColor.backgroundcolor),
                      right:
                          BorderSide(width: 1, color: AppColor.backgroundcolor),
                      bottom: BorderSide(
                          width: 3, color: AppColor.backgroundcolor)),
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
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
                left: 15,
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
                  " 1.00 -2.30  pm",
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
    ]);
  }
}
