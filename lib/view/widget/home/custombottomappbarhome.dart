import 'package:bus_tracking/controllers/homescreen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
                // children: [
                //   ...List.generate(controller.listPage.length + 1, ((index) {
                //     int i = index > 1 ? index - 1 : index;
                //     return index == 1
                //         ? const SizedBox()
                //         : CustomButtonAppBar(
                //             textbutton: controller.bottomappbar[i]['title'],
                //             icondata: controller.bottomappbar[i]['icon'],
                //             onPressed: () {
                //               controller.changePage(i);
                //             },
                //             active: controller.currentpage == i ? true : false);
                //   }))
                // ],
                )));
  }
}
