import 'package:bus_tracking/core/constant/app.dart';
import 'package:bus_tracking/core/functions/fcmconfig.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  Future<void> requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("تنبيه", "الرجاء تشغيل خدمة تحديد الموقع.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("تنبيه", "الرجاء إعطاء صلاحية الموقع للتطبيق.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.defaultDialog(
        title: "تنبيه",
        middleText:
            "تم رفض صلاحية الموقع بشكل دائم. الرجاء تفعيل الصلاحيات من الإعدادات.",
        textCancel: "إغلاق",
        textConfirm: "فتح الإعدادات",
        onConfirm: () async {
          await openAppSettings();
          Get.back();
        },
      );
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();

    requestPermissionNotification();
    fcmconfig();

    requestLocationPermission();

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang != null) {
      language = Locale(sharedPrefLang);
      appTheme = sharedPrefLang == "ar" ? themeArabic : themeEnglish;
    } else {
      Locale deviceLocale = Get.deviceLocale ?? const Locale('en');
      language = Locale(deviceLocale.languageCode);
      appTheme = themeEnglish;
    }

    Get.changeTheme(appTheme);
    Get.updateLocale(language!);
  }
}
