import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  final int productId;
  final String productName;
  int quantity;
  final double price;
  final String productImage;

  CartItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.productImage,
  });

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'quantity': quantity,
        'price': price,
        'productImage': productImage,
      };

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'],
      productImage: map['productImage'],
    );
  }
}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  double _totalAmount = 0.0;
  bool _isLoggedIn = false;

  List<CartItem> get items => _items;
  int get itemCount => _items.length;
  double get totalAmount => _totalAmount;
  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void updateItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _items.length) {
      _items[index].quantity = newQuantity;
      updateTotal();
      notifyListeners();
    } else {
      print('Invalid index: $index');
    }
  }

  void updateTotal() {
    _totalAmount =
        _items.fold(0.0, (total, item) => total + item.price * item.quantity);
    notifyListeners();
  }

  void removeItem(int index) async {
    if (index >= 0 && index < _items.length) {
      String productImage = _items[index].productImage;

      _items.removeAt(index);
      updateTotal();
      notifyListeners();

      if (_isLoggedIn) {
        await _deleteFromFirestore(_items[index].productId);
      }

      print('Removed item at index $index');
    } else {
      print('Invalid index: $index');
    }
  }

  double calculateTotalAmount(List<Map<String, dynamic>>? cartItems) {
    if (cartItems == null || cartItems.isEmpty) {
      return 0.0;
    }

    double totalAmount = 0.0;

    for (var element in cartItems) {
      double itemTotal = (element['price'] ?? 0.0) * (element['quantity'] ?? 0);
      totalAmount += itemTotal;
    }

    return totalAmount;
  }

  Future<void> _deleteFromFirestore(int productId) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('cart')
            .doc(productId.toString())
            .delete();
      }
    } catch (e) {
      print('Error deleting from Firestore: $e');
    }
  }

  Future<void> addToCart(CartItem item) async {
    var existingItemIndex = _items.indexWhere(
      (cartItem) => cartItem.productId == item.productId,
    );

    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }

    notifyListeners();
    await _saveCartLocally();

    if (_isLoggedIn) {
      await _saveToFirestore(item);
    }

    updateTotal();
  }

  Future<void> initialize() async {
    await _loadCartLocally();
  }

  Future<void> _saveCartLocally() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String cartItemsJsonString =
          jsonEncode(_items.map((item) => item.toJson()).toList());
      await prefs.setString('cartItems', cartItemsJsonString);
    } catch (e) {
      print('Error saving cart: $e');
    }
  }

  Future<void> _loadCartLocally() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cartItemsJsonString = prefs.getString('cartItems');

      if (cartItemsJsonString != null) {
        List<dynamic> loadedCartItems = jsonDecode(cartItemsJsonString);
        _items = loadedCartItems.map((json) => CartItem.fromMap(json)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error loading cart: $e');
    }
  }

  Future<void> _saveToFirestore(CartItem item) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('cart')
            .doc(item.productId.toString())
            .set(item.toJson());
      }
    } catch (e) {
      print('Error saving to Firestore: $e');
    }
  }
}
