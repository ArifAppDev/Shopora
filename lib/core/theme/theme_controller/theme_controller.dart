import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopora/core/theme/dart_mode.dart';
import 'package:shopora/core/theme/light_mode.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  var isDark = false.obs;
  @override
  void onInit() {
    super.onInit();
    isDark.value = _box.read('isDark') ?? false;
  }

  ThemeData get theme => isDark.value ? darkMode : lightMode;
  void toggleTheme(bool value) {
    isDark.value = value;
    _box.write('isDark', value);
  }
}
