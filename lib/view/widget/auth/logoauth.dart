import 'package:bus_tracking/core/constant/imageassests.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssest.logo,
      height: 170,
    );
  }
}
