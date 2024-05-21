import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/card2produ.dart';
import 'package:flutter_application_1/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class storybar2 extends StatefulWidget {
  @override
  State<storybar2> createState() => story11();
}

class story11 extends State<storybar2> {
  Future<List<ProductRest>> clothes() async {
    var Url = Uri.parse(
        "https://fakestoreapi.com/products/category/women's%20clothing");
    try {
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<ProductRest> product = data.map<ProductRest>((item) {
          return ProductRest.fromJson(item);
        }).toList();
        return product;
      } else
        () {
          print('API returned an error: ${response.statusCode}');
          return [];
        };
    } catch (e) {
      print('error $e');
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Text(''),
            )
          ],
        ),
        body: FutureBuilder<List<ProductRest>>(
          future: clothes(),
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
                  itemBuilder: (cpntext, index) {
                    var product = snapshot.data![index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
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
                                height: 99,
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
                                child: Text(
                                    '\$${product.price.toStringAsFixed(2)}'),
                              ),
                            ],
                          ),
                        ));
                  });
            }
          },
        ));
  }
}
