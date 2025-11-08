import 'package:flutter/material.dart';
import 'package:shopora/presentation/widgets/my_button.dart';
import 'package:shopora/utils/static_string/static_string.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ========== logo ========
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 10),

            // ========== title ========
            Text(
              StaticString.brandname,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // ========== subtitle ========
            Text(
              StaticString.premiulQuality,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            // ========== button ========
            MyButton(
              onTap: () {
                Navigator.pushNamed(context, '/shop_page');
              },
              child: Icon(Icons.arrow_forward, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
