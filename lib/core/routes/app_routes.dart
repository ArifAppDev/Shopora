import 'package:get/get.dart';
import 'package:shopora/presentation/screens/cart_page/cart_page.dart';
import 'package:shopora/presentation/screens/intro_page/intro_page.dart';
import 'package:shopora/presentation/screens/setting_section/setting_screen.dart';
import 'package:shopora/presentation/screens/shop_page/shop_page.dart';

class AppRoutes {
  static const String intropage = '/intropage';
  static const String shoppage = '/shoppage';
  static const String cartpage = '/cartpage';
  static const String settingsScreen = '/settings';

  static List<GetPage> routes = [
    GetPage(name: intropage, page: () => IntroPage()),
    GetPage(name: shoppage, page: () => ShopPage()),
    GetPage(name: cartpage, page: () => CartPage()),
    GetPage(name: settingsScreen, page: () => SettingsScreen()),
  ];
}
