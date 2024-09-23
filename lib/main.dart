import 'package:e_commerce_app_with_cart/models/shop.dart';
import 'package:e_commerce_app_with_cart/pages/cart_page.dart';
import 'package:e_commerce_app_with_cart/pages/intro_page.dart';
import 'package:e_commerce_app_with_cart/pages/shop_page.dart';
import 'package:e_commerce_app_with_cart/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    )
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
        '/intro': (context) => const IntroPage(),
        '/shop': (context) => const ShopPage(),
        '/cart': (context) => const CartPage(),
      }
    );
  } 
}