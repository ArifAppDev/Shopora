import 'package:flutter/material.dart';

import 'package:shopora/presentation/widgets/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //==========drawer header===================
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),

              //===========shop=============
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              //=========cart===============
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cartpage');
                },
              ),
            ],
          ),

          //==========settings============
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/intropage',
                (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
