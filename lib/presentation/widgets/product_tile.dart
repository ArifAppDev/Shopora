import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopora/models/product.dart';
import 'package:shopora/models/shop.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;

  void addtoCart(BuildContext context) {
    // ====== a dialog box add to cart=========
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Add this item to your Cart",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),

        actions: [
          //======= cancle button =============
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),

              color: Theme.of(context).colorScheme.primary,
            ),
            child: MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancle"),
            ),
          ),

          SizedBox(width: 5),

          //============ yes button add to cart ==========
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);

                //====== add to cart=======
                context.read<Shop>().addToCart(product);
              },
              child: Text("Add"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,

                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagepath),
                ),
              ),

              const SizedBox(height: 25),

              // product name
              Text(
                product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              // product price
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              // =============== add to cart button =============
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: IconButton(
                  onPressed: () => addtoCart(context),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
