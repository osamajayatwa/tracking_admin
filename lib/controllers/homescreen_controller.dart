import 'package:bus_tracking/profile.dart';
import 'package:bus_tracking/view/screen/home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const Profile(),
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Profile", "icon": Icons.person_2_outlined},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
