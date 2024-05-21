// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class CartItem {
//   final int productId;
//   final String productName;
//   int quantity;
//   final double price;

//   CartItem({
//     required this.productId,
//     required this.productName,
//     required this.quantity,
//     required this.price,
//   });

//   Map<String, dynamic> toJson() => {
//         'productId': productId,
//         'productName': productName,
//         'quantity': quantity,
//         'price': price,
//       };

//   factory CartItem.fromMap(Map<String, dynamic> map) {
//     return CartItem(
//       productId: map['productId'],
//       productName: map['productName'],
//       quantity: map['quantity'],
//       price: map['price'],
//     );
//   }
// }

// class CartProvider with ChangeNotifier {
//   List<CartItem> _items = [];
//   bool _isLoggedIn = false;
//   String? _authToken; // Added authentication token

//   List<CartItem> get items => _items;
//   int get itemCount => _items.length;
//   double get totalPrice =>
//       _items.fold(0, (total, item) => total + item.price * item.quantity);
//   bool get isLoggedIn => _isLoggedIn;

//   void login() {
//     _isLoggedIn = true;
//     notifyListeners();
//   }

//   void logout() {
//     _isLoggedIn = false;
//     notifyListeners();
//   }

//   // Set authentication token
//   void setAuthToken(String? authToken) {
//     _authToken = authToken;
//   }

//   Future<void> addToCart(CartItem item) async {
//     var existingItemIndex = _items.indexWhere(
//       (cartItem) => cartItem.productId == item.productId,
//     );

//     if (existingItemIndex != -1) {
//       _items[existingItemIndex].quantity += item.quantity;
//     } else {
//       _items.add(item);
//     }

//     notifyListeners();
//     await _saveCartLocally();

//     // Check if user is logged in and has a valid token
//     if (_isLoggedIn && _authToken != null) {
//       await _addToCartApi(item);
//     }
//   }

//   // Add item to cart using API
//   Future<void> _addToCartApi(CartItem item) async {
//     try {
//       var url = Uri.parse("https://fakestoreapi.com/carts");
//       await http.post(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $_authToken",
//         },
//         body: jsonEncode(
//           {
//             'userId': 5,
//             'date': "2020-02-03",
//             'products': [
//               {'productId': item.productId, 'quantity': item.quantity}
//             ],
//           },
//         ),
//       );
//     } catch (e) {
//       print('Error adding to cart API: $e');
//     }
//   }

//   // Rest of the CartProvider code...

//   // Add the remaining code for local storage and initialization...

//   // Rest of the CartProvider code...
// }
