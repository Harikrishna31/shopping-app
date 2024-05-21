// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:carousel_slider/carousel_slider.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Shop1(),
//   ));
// }

// class Shop1 extends StatefulWidget {
//   @override
//   State<Shop1> createState() {
//     return Screen3();
//   }
// }

// class Screen3 extends State<Shop1> {
//   final List<String> hello = [
//     'assets/hb.jpg',
//     'assets/he.jpg',
//     'assets/hi.jpg',
//     'assets/bi.jpg',
//     'assets/hq.jpg',
//   ];

//   List<Widget> getImages() {
//     return hello
//         .map((e) => ClipRRect(
//               child: Image.asset(
//                 e,
//                 width: 500,
//                 fit: BoxFit.fill,
//               ),
//               borderRadius: BorderRadius.circular(20.1),
//             ))
//         .toList();
//   }

//   Future<List<dynamic>> _getProducts() async {
//     final fakeApi = "https://fakestoreapi.com";
//     final productsEndpoint = "$fakeApi/products";

//     final response = await http.get(Uri.parse(productsEndpoint));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return List<dynamic>.from(data);
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.person)), // Use a valid icon
//         ],
//         iconTheme: IconThemeData(color: Colors.black),
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           // Your widget tree here
//           // ...
//           CarouselSlider(
//             items: getImages(),
//             options: CarouselOptions(
//               height: 200,
//               clipBehavior: Clip.hardEdge,
//               autoPlay: true,
//               viewportFraction: 1.5,
//             ),
//           ),
//           FutureBuilder<List<dynamic>>(
//             future: _getProducts(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(child: Text('No products available.'));
//               }
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Image.network(snapshot.data![index]['image'],
//                       width: 100, height: 100);
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
