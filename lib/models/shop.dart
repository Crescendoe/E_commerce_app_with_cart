import 'package:e_commerce_app_with_cart/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  
  // Products for Sale
  final List<Product> _shop = [
  
  Product(
    name: 'Product 1',
    description: 'assets/images/product1.png',
    price: 100.0,
  ),
  Product(
    name: 'Product 2',
    description: 'assets/images/product2.png',
    price: 200.0,
  ),
  Product(
    name: 'Product 3',
    description: 'assets/images/product3.png',
    price: 300.0,
  ),
  Product(
    name: 'Product 4',
    description: 'assets/images/product4.png',
    price: 400.0,
  ),
  ];

  // User cart
  final List<Product> _cart = [];

  // Get Product List
  List <Product> get shop => _shop;

  // Get User Cart
  List <Product> get cart => _cart;

  // Add Product to Cart
  void addProductToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  // Remove Product from Cart
  void removeProductFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }

}
