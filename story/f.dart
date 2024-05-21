// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // import 'cardclass.dart';

// // class ProductDetailPage extends StatelessWidget {
// //   final int productId; // Replace with your product ID
// //   final String productName; // Replace with your product name
// //   final double productPrice;
// //   final String productImage; // Replace with your product price

// //   ProductDetailPage({
// //     required this.productImage,
// //     required this.productId,
// //     required this.productName,
// //     required this.productPrice,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(productName),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Container(
// //               child: Image(
// //                   image: NetworkImage(
// //                     productImage,
// //                   ),
// //                   height: 200,
// //                   width: 200),
// //             ),
// //             Text(
// //               'Product Details',
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             Text('Product Name: $productName'),
// //             Text('Product Price: \$${productPrice.toStringAsFixed(2)}'),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Add the product to the cart
// //                 context.read<CartProvider>().addToCart(
// //                       CartItem(
// //                         productId: productId,
// //                         productName: productName,
// //                         quantity: 1, // You may adjust the quantity
// //                         price: productPrice, productimage: productImage,
// //                       ),
// //                     );

// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('Product added to the cart'),
// //                   ),
// //                 );
// //               },
// //               child: Text('Add to Cart'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // product_page.dart

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'cardclass.dart';
// // import 'cartauth.dart';

// // class ProductPage extends StatelessWidget {
// //   final int productId;
// //   final String productName;
// //   final double productPrice;

// //   ProductPage({
// //     required this.productId,
// //     required this.productName,
// //     required this.productPrice,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(productName),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               'Product Details',
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             Text('Product Name: $productName'),
// //             Text('Product Price: \$${productPrice.toStringAsFixed(2)}'),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 context.read<CartProvider>().addToCart(
// //                       CartItem(
// //                         productId: productId,
// //                         productName: productName,
// //                         quantity: 1,
// //                         price: productPrice,
// //                       ),
// //                     );

// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('Product added to the cart'),
// //                   ),
// //                 );
// //               },
// //               child: Text('Add to Cart'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // Import your CartProvider
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProductPage extends StatelessWidget {
//   final int productId;
//   final String productImage;
//   final String productName;
//   final double productPrice;

//   ProductPage({
//     required this.productImage,
//     required this.productId,
//     required this.productName,
//     required this.productPrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(productName),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               productImage,
//               height: 100,
//             ),
//             Text(
//               'Product Details',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Text('Product Name: $productName'),
//             Text('Product Price: \$${productPrice.toStringAsFixed(2)}'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 // Add the product to the cart in Firestore
//                 await FirebaseFirestore.instance.collection('carts').add({
//                   'userId': FirebaseAuth.instance.currentUser?.uid,
//                   'productId': productId,
//                   'productImage': productImage,
//                   'productName': productName,
//                   'quantity': 1,
//                   'price': productPrice,
//                 });

//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Product added to the cart'),
//                   ),
//                 );
//               },
//               child: Text('Add to Cart'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
