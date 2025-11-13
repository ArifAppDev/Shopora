import 'package:get/get.dart';
import 'package:shopora/core/theme/theme_controller/theme_controller.dart';
import 'package:shopora/models/shop.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(() => ShopController());
    // ========== theme controller ===============
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
