import 'package:bus_tracking/admin/controllers/home_controller.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/imageassests.dart';
import 'package:bus_tracking/core/functions/ridesalert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAdminRidesHome extends GetView<AdminHomeControllerImp> {
  const ListAdminRidesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isClickable = isWithinTimeRange();
    final bool isClickable2 = isWithinTimeRange2();

    return Column(
      children: [
        SizedBox(
            width: 380,
            height: 250,
            child: InkWell(
              onTap: () {
                if (isClickable) {
                  controller.goToRidesMorning();
                } else {
                  showAlertDialog(context);
                }
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // margin: const EdgeInsets.only(top: 20, bottom: 35),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Image.asset(
                      ImageAssest.logo,
                      height: 250,
                      width: 170,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              width: 1, color: AppColor.primaryColor),
                          right: BorderSide(
                              width: 1, color: AppColor.primaryColor),
                          bottom: BorderSide(
                            width: 3,
                            color: AppColor.primaryColor,
                          )),
                      color: AppColor.backgroundcolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 80,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: AppColor.grey.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 30,
                      width: 200,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Morning Rides",
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.primaryColor,
                        ),
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
                      "6.00-8.00",
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(
          height: 25,
        ),
        SizedBox(
            width: 380,
            height: 250,
            child: InkWell(
              onTap: () {
                if (isClickable2) {
                  controller.goToRidesEvining();
                } else {
                  showAlertDialog2(context);
                }
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // margin: const EdgeInsets.only(top: 20, bottom: 35),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Image.asset(
                      ImageAssest.logo,
                      height: 250,
                      width: 170,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              width: 1, color: AppColor.primaryColor),
                          right: BorderSide(
                              width: 1, color: AppColor.primaryColor),
                          bottom: BorderSide(
                            width: 3,
                            color: AppColor.primaryColor,
                          )),
                      color: AppColor.backgroundcolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 80,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: AppColor.grey.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 30,
                      width: 200,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Evining Rides",
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.primaryColor,
                        ),
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
                      "1.00-3.00",
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
