import 'dart:convert';

import 'package:flutter/material.dart';

import '../auth.dart';
import 'package:http/http.dart' as http;

class api {
 static  Future<List<ProductRest>> getproduct(BuildContext context ) async {
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
  Future<List<ProductRest>> searchproductst(BuildContext context) async {
    var url = Uri.parse("https://fakestoreapi.com/products/categories");

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
}
