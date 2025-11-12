import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopora/core/routes/app_routes.dart';

import 'package:shopora/models/shop.dart';

import 'package:shopora/presentation/widgets/my_drawer.dart';
import 'package:shopora/presentation/widgets/product_tile.dart';
import 'package:shopora/utils/static_string/static_string.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // get access to the controller's and it's funcionality
    final ShopController shopController = Get.find<ShopController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Shop Page"),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // go to cart Button
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () => Get.toNamed(AppRoutes.cartpage),
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),

      drawer: const MyDrawer(),

      backgroundColor: Theme.of(context).colorScheme.surface,

      body: ListView(
        children: [
          const SizedBox(height: 25),
          // ========= shop subtitle==============
          Center(
            child: Text(
              StaticString.shopsubtitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shopController.shop.length,
              padding: const EdgeInsets.all(25),
              itemBuilder: (context, index) {
                // ========= get product from shop=========
                final product = shopController.shop[index];

                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
