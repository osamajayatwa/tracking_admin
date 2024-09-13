import 'package:bus_tracking/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.seconedcolor,
        ),
        alignment: Alignment.center,
        width: Get.width,
        child: Text(title,
            style: const TextStyle(
                fontSize: 20,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
