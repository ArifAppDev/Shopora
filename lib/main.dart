import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopora/core/theme/light_mode.dart';
import 'package:shopora/models/shop.dart';
import 'package:shopora/presentation/screens/cart_page/cart_page.dart';
import 'package:shopora/presentation/screens/intro_page/intro_page.dart';
import 'package:shopora/presentation/screens/shop_page/shop_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,

      routes: {
        '/intropage': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
