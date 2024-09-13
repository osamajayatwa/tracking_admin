import 'package:bus_tracking/admin/profile.dart';
import 'package:bus_tracking/admin/screen/home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class AdminHomeScreenController extends GetxController {
  changePage(int currentpage);
}

class AdminHomeScreenControllerImp extends AdminHomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const AdminHomePage(),
    const AdminProfile(),
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "profile", "icon": Icons.person_2_outlined},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
