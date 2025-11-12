import 'package:get/get.dart';
import 'package:shopora/models/shop.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(() => ShopController());
  }
}
