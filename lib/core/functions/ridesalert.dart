import 'package:bus_tracking/core/constant/color.dart';
import 'package:flutter/material.dart';

bool isWithinTimeRange() {
  final now = DateTime.now();
  final startTime = DateTime(now.year, now.month, now.day, 00, 0);
  final endTime = DateTime(now.year, now.month, now.day, 24, 00);

  return now.isAfter(startTime) && now.isBefore(endTime);
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: AlertDialog(
          shadowColor: AppColor.primaryColor,
          surfaceTintColor: AppColor.primaryColor,
          title: Text(
            "Sorry",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 25),
          ),
          content: Text(
            "This action is only available between 6:00 and 8:00 am.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColor.grey2),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(color: AppColor.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

bool isWithinTimeRange2() {
  final now = DateTime.now();
  final startTime = DateTime(now.year, now.month, now.day, 00, 0);
  final endTime = DateTime(now.year, now.month, now.day, 24, 00);

  return now.isAfter(startTime) && now.isBefore(endTime);
}

void showAlertDialog2(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: AlertDialog(
          shadowColor: AppColor.primaryColor,
          surfaceTintColor: AppColor.primaryColor,
          title: Text(
            "Sorry",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 25),
          ),
          content: Text(
            "This action is only available between 1:00 and 3:00 pm.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColor.grey2),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(color: AppColor.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
