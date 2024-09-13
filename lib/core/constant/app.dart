import 'package:bus_tracking/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 12),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 12),
  ),
);
