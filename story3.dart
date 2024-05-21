import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/card2produ.dart';
import 'package:flutter_application_1/product.dart';
import 'package:http/http.dart' as http;

import 'auth.dart';

class Search11 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search11> {
  Future<List<ProductRest>> searchElectronicProducts() async {
    var url =
        Uri.parse("https://fakestoreapi.com/products/category/electronics");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        List<ProductRest> products = data.map<ProductRest>((item) {
          return ProductRest.fromJson(item);
        }).toList();

        return products;
      } else {
        print('API returned an error: ${response.statusCode}');
        return []; // Handle API error or return an empty list
      }
    } catch (e) {
      print('Error: $e');
      return [];
      // Handle exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(""),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_left),
          )
        ],
      ),
      body: FutureBuilder<List<ProductRest>>(
        future: searchElectronicProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
              itemBuilder: (context, index) {
                var product = snapshot.data![index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      
                      MaterialPageRoute(
                          builder: (context) =>
                              // ProductDetailPage(
                              //   productImage: product.image,
                              //   productId: product.id, productName: product.title,
                              //   productPrice: product.price,

                              //   // cartProvider: CartProvider(),
                              // ),
                              ProductPage(
                                  productImage: product.image,
                                  productId: product.id,
                                  productName: product.title,
                                  productPrice: product.price)),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          product.image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('\$${product.price.toStringAsFixed(2)}'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
