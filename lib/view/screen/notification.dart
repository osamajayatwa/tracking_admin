import 'package:bus_tracking/controllers/notification_controller.dart';
import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/view/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
        builder: (controller) => Scaffold(
              drawer: Drawer(
                child: CustomDrawer(),
              ),
              body: Builder(
                builder: (context) => (
                    // statusrequest: controller.statusrequest,
                    // widget: Scaffold(
                    // body: Container(
                    // padding:
                    //  const EdgeInsets.all(10),
                    // child:
                    ListView(children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.all(5),
                    child: Row(children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.table_rows_rounded,
                            size: 30,
                          ),
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(top: 15),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.primaryColor),
                        child: Text(
                          textAlign: TextAlign.center,
                          'users',
                        ),
                      )),
                      const SizedBox(width: 10),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(height: 10),
                  ...List.generate(
                      controller.data.length,
                      (index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Stack(
                              children: [
                                ListTile(
                                  title: Text(controller.data[index]
                                      ['notification_title']),
                                  subtitle: Text(controller.data[index]
                                      ['notification_body']),
                                ),
                                Positioned(
                                    right: 5,
                                    child: Text(
                                      Jiffy.parse(
                                              controller.data[index]
                                                  ['notification_datetime'],
                                              pattern: "yyyy-MM-dd")
                                          .fromNow(),
                                      style: const TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ))
                ])),
              ),
            ));
  }
}
