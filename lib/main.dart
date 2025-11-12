import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopora/core/dependency_injection/di.dart';
import 'package:shopora/core/routes/app_routes.dart';

import 'package:shopora/core/theme/light_mode.dart';

void main() {
  DependencyInjection().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.intropage,
      getPages: AppRoutes.routes,
      theme: lightMode,
    );
  }
}
