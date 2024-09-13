import 'dart:io';

import 'package:bus_tracking/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "05".tr,
      titleStyle: const TextStyle(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: "06".tr,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: Text("07".tr)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: Text("04".tr)),
      ]);
  return Future.value(true);
}
