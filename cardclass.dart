import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class CartItem {
//   final int productId;
//   final String productName;
//   late final int quantity;
//   final double price;
//   final String productimage;

//   CartItem({
//     required this.productimage,
//     required this.productId,
//     required this.productName,
//     required this.quantity,
//     required this.price,
//   });
// }

// class CartProvider with ChangeNotifier {
//   List<CartItem> _items = [];

//   List<CartItem> get items => _items;

//   int get itemCount => _items.length;

//   double get totalPrice {
//     return _items.fold(0, (total, item) => total + item.price * item.quantity);
//   }

//   void addToCart(CartItem item) {
//     _items.add(item);
//     notifyListeners();
//   }

//   void updateCart(List<CartItem> newItems) {
//     _items.clear();
//     _items.addAll(newItems);
//     notifyListeners();
//   }

//   void initialize() {}
// }
// cart_provider.dart


// cart_item.dart

