import 'package:bus_tracking/core/constant/color.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListChildrenoftheride extends StatefulWidget {
  const ListChildrenoftheride({super.key});

  @override
  _ListChildrenoftherideState createState() => _ListChildrenoftherideState();
}

class _ListChildrenoftherideState extends State<ListChildrenoftheride> {
  int lastEndedChildIndex =
      -1; // Tracks the last child index whose "End" button was pressed
  List<ChildData> children = [
    ChildData(name: "Child one"),
    ChildData(name: "Child two"),
    ChildData(name: "Child three"),
    ChildData(name: "Child four"),
    ChildData(name: "Child five"),
    ChildData(name: "Child six"),
    ChildData(name: "Child seven"),
    ChildData(name: "Child eight"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Children of the Ride"),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: children.length,
              itemBuilder: (context, index) {
                final child = children[index];
                return Column(
                  children: [
                    if (index > 0) SizedBox(height: 20),
                    InkWell(
                      onTap: (canStartChild(index))
                          ? () async {
                              final result = await Get.toNamed(
                                AppRoute.tracking,
                                arguments: index,
                              );
                              if (result != null && result is int) {
                                setState(() {
                                  // Remove the child when tracking ends
                                  children.removeAt(result);
                                  lastEndedChildIndex = result - 1;
                                });
                              }
                            }
                          : null,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: 3, color: AppColor.primaryColor),
                                  left: BorderSide(
                                      width: 1, color: AppColor.primaryColor),
                                  right: BorderSide(
                                      width: 1, color: AppColor.primaryColor),
                                  bottom: BorderSide(
                                      width: 3, color: AppColor.primaryColor),
                                ),
                                color:
                                    AppColor.backgroundcolor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              height: 100,
                              width: 360,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 135),
                              child: Text(
                                textAlign: TextAlign.right,
                                child.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 15,
                              child: Text(
                                "Location",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColor.red,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 15,
                              child: Text(
                                "Street",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColor.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool canStartChild(int index) {
    if (index == 0) {
      return !children[index].isStarted;
    } else {
      return children[index - 1].isEnded && !children[index].isStarted;
    }
  }
}

class ChildData {
  final String name;
  bool isStarted;
  bool isEnded;

  ChildData({
    required this.name,
    this.isStarted = false,
    this.isEnded = false,
  });
}
