import 'package:flutter/material.dart';

import 'auth.dart';


class ShoppingCart {
  List<ProductRest> items = [];

  void addToCart(ProductRest product) {
    items.add(product);
  }
}

class ProductDetailPage extends StatelessWidget {
  final ProductRest product;
  final ShoppingCart cart;

  ProductDetailPage({required this.product, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product.description,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 20),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add the product to the cart
                cart.addToCart(product);
                // Show a confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product added to the cart'),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
            // Additional details...
          ],
        ),
      ),
    );
  }
}
