import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopora/models/product.dart';
import 'package:shopora/models/shop.dart';

import 'package:shopora/presentation/widgets/my_button.dart';
import 'package:shopora/utils/static_string/static_string.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemfromCart(
    BuildContext context,
    Product product,
    ShopController shoppingController,
  ) {
    //=== a dialog box ask to user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Remove this item from your Cart",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),

        actions: [
          SizedBox(width: 5),

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ),

          //============ Remove button ==========
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);

                //====== remove  cart=======
                shoppingController.removeFromCart(product);
              },
              child: Text("Remove"),
            ),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "User have to complete his payment with bkash, Rocket, Nogotd,etc",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //=========== get access to the cart===========
    final ShopController shopController = Get.find<ShopController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Cart page'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Column(
        children: [
          // ================= cart list =================
          Expanded(
            child: Obx(() {
              return shopController.cart.isEmpty
                  ? Center(child: const Text("You Cart is empty"))
                  : ListView.builder(
                      itemCount: shopController.cart.length,
                      itemBuilder: (context, index) {
                        // ===== get indivisual item cart ==================
                        final item = shopController.cart[index];

                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            onPressed: () => removeItemfromCart(
                              context,
                              item,
                              shopController,
                            ),
                            icon: Icon(Icons.delete),
                          ),
                        );
                      },
                    );
            }),
          ),

          // ========pay button===========
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
              child: Text(StaticString.paynow),
              onTap: () => payButtonPressed(context),
            ),
          ),
        ],
      ),
    );
  }
}
