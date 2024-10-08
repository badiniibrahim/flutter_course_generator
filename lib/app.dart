import 'package:course_generator/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'config/app_pages.dart';

class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Course Generator",
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("fr"),
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      //initialBinding: AppBinding(),
      translationsKeys: AppTranslation.translations,
    );
  }
}
