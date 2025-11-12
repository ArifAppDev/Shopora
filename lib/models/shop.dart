import 'package:get/state_manager.dart';
import 'package:shopora/core/custom_assets/custom_images/custom_images.dart';
import 'package:shopora/models/product.dart';

class ShopController extends GetxController {
  // product for sale
  final shop = <Product>[
    /// product 1
    Product(
      name: "Nike Jordan 1 Mid",
      price: 400,
      description:
          "The Nike Air Jordan 1 blends iconic basketball heritage with timeless street style and premium comfort.",
      imagepath: CustomImages.product1,
    ),

    /// product 2
    Product(
      name: "Nike Jordan 1 Mid Silver",
      price: 350,
      description:
          "The Nike Air Jordan 1 blends iconic basketball heritage with timeless street style and premium comfort.",
      imagepath: CustomImages.product2,
    ),

    /// product 3
    Product(
      name: "Black Smart Sunglass",
      price: 100.00,
      description: "This sunglass protect from sunlight",
      imagepath: CustomImages.product3,
    ),

    /// product 4
    Product(
      name: "Nike Jordan 1 Mid Red",
      price: 400,
      description:
          "The Nike Air Jordan 1 blends iconic basketball heritage with timeless street style and premium comfort.",
      imagepath: CustomImages.product4,
    ),

    /// product 5
    Product(
      name: "Sunglass",
      price: 50,
      description: "Normal sunglass",
      imagepath: CustomImages.product5,
    ),

    /// product 6
    Product(
      name: "Jodran 1 Mid Green",
      price: 390,
      description:
          "The Nike Air Jordan 1 blends iconic basketball heritage with timeless street style and premium comfort.",
      imagepath: CustomImages.product6,
    ),

    /// product 7
    Product(
      name: "Watch",
      price: 300,
      description: "This is a Smart that can help you in daily work",
      imagepath: CustomImages.product7,
    ),

    /// product 8
    Product(
      name: "Smart Watch",
      price: 140,
      description:
          "This smart watch can check you heart beat reate how much you run everyday and other fitness tracks too.",
      imagepath: CustomImages.product8,
    ),
  ].obs;
  // user cart
  final cart = <Product>[].obs;

  //add item to cart
  void addToCart(Product item) {
    cart.add(item);
  }

  // removing item from cart
  void removeFromCart(Product item) {
    cart.remove(item);
  }

  // total price
  double get totalPrice => cart.fold(0, (sum, item) => item.price);
}
