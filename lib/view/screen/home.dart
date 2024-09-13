import 'package:bus_tracking/controllers/home_controller.dart';

import 'package:bus_tracking/view/screen/listdriverrideshome.dart';
import 'package:bus_tracking/view/widget/drawer.dart';

import 'package:bus_tracking/view/widget/home/customcardhome.dart';
import 'package:bus_tracking/view/widget/home/customtitlehome.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  const CustomCardHome(title: "Alsanabel", body: "School"),
                  CustomTitleHome(title: "Rides"),
                  SizedBox(
                    height: 20,
                  ),
                  ListDriverRidesHome(),
                ],
              )),
          drawer: Drawer(child: CustomDrawer())),
    );
  }
}
