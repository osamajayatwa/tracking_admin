import 'package:bus_tracking/controllers/splashcontroller.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/view/widget/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue as",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Custom(
              textbottun: "Admin",
              onPressed: () {
                Get.toNamed(AppRoute.adminlogin);
              },
            ),
            Custom(
              textbottun: "Driver",
              onPressed: () {
                Get.toNamed(AppRoute.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
