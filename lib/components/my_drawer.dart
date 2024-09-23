import 'package:e_commerce_app_with_cart/components/my_list_tile.dart';
import 'package:flutter/material.dart';

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
              // Drawer Header
              DrawerHeader(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: Icon(
                      Icons.shopping_bag,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),

                // Shop Title
                MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () {
                  // Pop drawer
                  Navigator.pop(context); // First, pops the drawer

                  // Navigate to Shop Page
                  Navigator.pushNamed(context, '/shop'); // Then, navigates to the shop page
                },
                ),

                // Cart Title
                MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  // Pop drawer
                  Navigator.pop(context); // First, pops the drawer

                  // Navigate to Cart Page
                  Navigator.pushNamed(context, '/cart'); // Then, navigates to the cart page
                },
                ),
            ],
          ),

          // Exit Shop Title
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.exit_to_app,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/intro', (route) => false
              ),
            ),
          ),
        ],
      ),
    );
  }
}