import 'package:e_commerce_app_with_cart/components/my_button.dart';
import 'package:e_commerce_app_with_cart/models/product.dart';
import 'package:e_commerce_app_with_cart/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_with_cart/components/my_drawer.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Method to remove cart item with dialog box asking user to confirm
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Item'),
          content: const Text('Do you want to remove this item from cart?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
            TextButton(
              onPressed: () {
                // remove the item from the cart
                context.read<Shop>().removeProductFromCart(product);
                Navigator.pop(context);
              },
              child: Text(
                'Remove',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          ],
        );
      },
    );
  }

  // Method when user presses the pay button
  void payButtonPressed(BuildContext context) {
    // Show dialog box with message
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment'),
          content: const Text('User wants to pay! Connect this app to payment backend.'),
          actions: [
            TextButton(
              onPressed: () {
                // Clear the cart
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty..."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // Get the product from the cart
                      final product = cart[index];

                      // return as a cart tile UI
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text(product.price.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => removeItemFromCart(context, product),
                        ),
                      );
                    },
                  ),
          ),

          // Pay button with icon
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.payment),
                  SizedBox(width: 8),
                  Text('Checkout'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
