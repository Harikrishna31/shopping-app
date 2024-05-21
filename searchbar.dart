// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/class.dart';
// import 'package:flutter_application_1/home.dart';
// import 'package:flutter_application_1/product.dart';
// import 'package:flutter_application_1/shop.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

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
//     'assets/hq.jpg'
//   ];

//   final List<String> userProfiles = [
//     'assets/man.png',
//     'assets/women.png',
//     'assets/menwomen.png',
//   ];

//   List<Widget> getImages() {
//     return hello
//         .map((e) => ClipRRect(
//               child: Image.asset(
//                 e,
//                 width: 700,
//                 fit: BoxFit.fill,
//               ),
//               borderRadius: BorderRadius.circular(20.1),
//             ))
//         .toList();
//   }

//   Future<List> _getproduct() async {
//     var url = Uri.parse("https://fakestoreapi.com/products");

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data;
//       } else {
//         print('API returned an error: ${response.statusCode}');
//         return []; // Handle API error or return an empty list
//       }
//     } catch (e) {
//       print('Error: $e');
//       return []; // Handle exceptions
//     }
//   }

//   @override
//   void initState() {
//     // _getproduct();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.person_4_rounded))
//         ],
//         iconTheme: IconThemeData(color: Colors.black),
//         backgroundColor: Colors.white30,
//       ),
//       drawer: Drawer(
//         backgroundColor: Colors.white,
//         elevation: 2.3,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 elevation: 0, // Remove button elevation
//               ),
//               child: ListTile(
//                 leading: Icon(
//                   Icons.person_2_sharp,
//                   size: 30,
//                   color: Colors.black, // Change icon color
//                 ),
//                 title: Text(
//                   "Profile",
//                   style: TextStyle(
//                       fontSize: 16, color: Colors.black), // Change text color
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle Men tap
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 padding: EdgeInsets.all(0), // Remove padding
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.male,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                     SizedBox(width: 16),
//                     Text(
//                       "Men",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle Women tap
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.pink,
//                 padding: EdgeInsets.all(0), // Remove padding
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.female,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                     SizedBox(width: 16),
//                     Text(
//                       "Women",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle Logout tap
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.red,
//                 padding: EdgeInsets.all(0), // Remove padding
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Iphone13()));
//                       },
//                       icon: Icon(Icons.exit_to_app),
//                       //   Icons.exit_to_app,
//                       //   size: 30,
//                       //   color: Colors.white, icon: null,
//                       // ),
//                     ),
//                     SizedBox(width: 16),
//                     Text(
//                       "Logout",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(children: [
//         // Instagram-like story bars
//         Container(
//           height: 100, // Adjust the height as needed
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             GestureDetector(
//               child: CircleAvatar(
//                 radius: 24,
//                 backgroundImage: AssetImage(userProfiles[1]),
//               ),
//             ),
//             SizedBox(width: 20),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Home()));
//               },
//               child: CircleAvatar(
//                 radius: 24,
//                 backgroundImage: AssetImage(userProfiles[0]),
//               ),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             GestureDetector(
//               child: CircleAvatar(
//                   radius: 24, backgroundImage: AssetImage(userProfiles[2])),
//             )
//           ]),
//         ),
//         CarouselSlider(
//           items: getImages(),
//           options: CarouselOptions(
//             height: 200,
//             clipBehavior: Clip.hardEdge,
//             autoPlay: true,
//             viewportFraction: 1.5,
//           ),
//         ),
//         Expanded(
//           child: FutureBuilder<List>(
//             future: _getproduct(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               return GridView.builder(
//                 itemCount: snapshot.data != null ? snapshot.data!.length : 0,
//                 itemBuilder: (context, index) {
//                   var product = snapshot.data![index];
//                   return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     ProductDetailPage(product: product)));
//                       },
//                       child: Card(
//                         child: Column(
//                           children: [
//                             Image.network(
//                               product['image'],
//                               width: 100,
//                               height: 100,
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               product['title'], // Display the product title
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Price: \$${product['price'].toStringAsFixed(2)}', // Display the product price
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 100,
//                                 ),
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(Icons.favorite_outline_rounded),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ));
//                 },
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//               );
//             },
//           ),
//         )
//       ]),
//     );
//   }
// }
