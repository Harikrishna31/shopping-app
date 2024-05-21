import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/payment.dart';
import 'package:provider/provider.dart';

import 'cartauth.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: StreamBuilder(
        stream: _fetchCartItemsStream(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          var cartItems = snapshot.data ?? [];

          if (cartItems.isEmpty) {
            return Center(
              child: Text('No items in the cart.'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    var cartItem = cartItems[index];

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red.shade100,
                        backgroundImage: NetworkImage(cartItem['productImage']),
                      ),
                      title: Text(
                        cartItem['productName'],
                        style: TextStyle(fontSize: 15),
                      ),
                      subtitle: Row(
                        children: [
                          Text('Quantity: ${cartItem['quantity']}'),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () async {
                              // Update UI first
                              cartProvider.updateItemQuantity(
                                index,
                                cartItem['quantity'] - 1,
                              );
                              if (cartItem['quantity'] <= 0) {
                                return _deleteCartItem(cartItem['cartId']);
                              } else if (cartItem == 0) {
                                return cartProvider.removeItem(index);
                              }

                              // Then perform Firestore operation
                              await _updateQuantity(
                                  cartItem['cartId'], cartItem['quantity'] - 1);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              // Update UI first
                              cartProvider.updateItemQuantity(
                                index,
                                cartItem['quantity'] + 1,
                              );
                              // Then perform Firestore operation
                              await _updateQuantity(
                                  cartItem['cartId'], cartItem['quantity'] + 1);
                            },
                          ),
                        ],
                      ),
                      trailing: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  '\$${(cartItem['quantity'] * cartItem['price']).toStringAsFixed(2)}'),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () async {
                                  // Update UI firstcont
                                  cartProvider.removeItem(index);
                                  // Then perform Firestore operation
                                  await _deleteCartItem(cartItem['cartId']);
                                },
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total Amount: \$${cartProvider.calculateTotalAmount(cartItems).toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()));
                      },
                      child: Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Stream<List<Map<String, dynamic>>> _fetchCartItemsStream() {
    var userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Stream.value([]);
    }

    var query = FirebaseFirestore.instance
        .collection('carts')
        .where('userId', isEqualTo: userId)
        .snapshots();

    return query.map(
      (snapshot) => snapshot.docs
          .map((doc) => {
                ...doc.data() as Map<String, dynamic>,
                'cartId': doc.id,
              })
          .toList(),
    );
  }

  Future<void> _deleteCartItem(String? cartItemId) async {
    if (cartItemId == null) {
      return;
    }

    await FirebaseFirestore.instance
        .collection('carts')
        .doc(cartItemId)
        .delete();
  }

  Future<void> _updateQuantity(String? cartItemId, int newQuantity) async {
    if (cartItemId == null) {
      return;
    }

    // Ensure the new quantity is greater than or equal to zero
    newQuantity = newQuantity < 0 ? 0 : newQuantity;

    await FirebaseFirestore.instance
        .collection('carts')
        .doc(cartItemId)
        .update({'quantity': newQuantity});
  }
}
