import 'package:bus_tracking/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconNotefication;
  const CustomAppBar({
    super.key,
    required this.titleappbar,
    this.onPressedIconNotefication,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: AppColor.backgroundcolor,
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(top: 15),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.backgroundcolor),
          child: Text(
            textAlign: TextAlign.center,
            titleappbar,
          ),
        )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: AppColor.backgroundcolor,
              borderRadius: BorderRadius.circular(20)),
          height: 50,
          width: 50,
          child: IconButton(
            onPressed: onPressedIconNotefication,
            icon: Icon(Icons.notifications),
            color: AppColor.black,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5),
        ),
        const SizedBox(width: 10),
      ]),
    );
  }
}
