import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/imageassests.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showdialograting(BuildContext context, ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            title: const Text(
              'Rating Dialog',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            message: const Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            image: Image.asset(
              ImageAssest.logo,
              width: 150,
              height: 150,
            ),
            submitButtonText: 'Submit',
            submitButtonTextStyle: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              // OrdersArchiveController controller = Get.find();
              // print('rating: ${response.rating}, comment: ${response.comment}');
              // controller.submitRating(
              //   ordersid,
              //   response.comment,
              //   response.rating,
              // );
            },
          ));
}
