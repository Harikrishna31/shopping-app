import 'dart:convert';

import 'auth.dart';
import 'package:http/http.dart'as http;

Future<List<ProductRest>> getProduct(String query) async {
  var url = Uri.parse("https://fakestoreapi.com/products");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      List<ProductRest> products = data.map<ProductRest>((item) {
        return ProductRest.fromJson(item);
      }).toList();

      // Filter products based on the query
      if (query.isNotEmpty) {
        products = products
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

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
