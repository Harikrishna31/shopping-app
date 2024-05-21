import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductRest {
  final String title;
  final double price;
  final String image;

  ProductRest({required this.title, required this.price, required this.image});

  factory ProductRest.fromJson(Map<String, dynamic> json) {
    return ProductRest(
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}

class Shop1 extends StatefulWidget {
  @override
  State<Shop1> createState() => Screen3();
}

class Screen3 extends State<Shop1> {
  List<ProductRest> searchproduct = [];
  bool isSearch = false;
  TextEditingController controller = TextEditingController();

  Future<List<ProductRest>> _getproduct() async {
    var url = Uri.parse("https://fakestoreapi.com/products");

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
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            onChanged: (keyword) {
              setState(() {
                isSearch = keyword.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search here...',
            ),
          ),
          Expanded(
            child: Isproducts(),
          ),
        ],
      ),
    );
  }

  Widget Isproducts() {
    return FutureBuilder<List<ProductRest>>(
      future: _getproduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<ProductRest> filteredProducts = snapshot.data ?? [];
        if (isSearch && controller.text.isNotEmpty) {
          filteredProducts = filteredProducts
              .where((product) => product.title
                  .toLowerCase()
                  .contains(controller.text.toLowerCase()))
              .toList();
        }

        return GridView.builder(
          itemCount: filteredProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            var product = filteredProducts[index];
            
            return Card(
              child: Column(
                children: [
                  Image.network(
                    product.image,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Price: \$${product.price.toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Shop1(),
  ));
}
