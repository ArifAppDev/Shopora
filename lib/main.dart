import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopora/core/dependency_injection/di.dart';
import 'package:shopora/core/routes/app_routes.dart';

import 'package:shopora/core/theme/theme_controller/theme_controller.dart';

void main() async {
  await GetStorage.init();
  DependencyInjection().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.intropage,
        getPages: AppRoutes.routes,
        theme: themeController.theme,
      ),
    );
  }
}
