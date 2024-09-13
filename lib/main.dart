import 'package:bus_tracking/Binding/intialbinding.dart';
import 'package:bus_tracking/core/localization/changelocal.dart';
import 'package:bus_tracking/core/localization/translation.dart';
import 'package:bus_tracking/core/services/services.dart';
import 'package:bus_tracking/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'BUS TRACKING',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
