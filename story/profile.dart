// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: ProfilePage(),
//   ));
// }

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   late User currentUser;
//   late Map<String, dynamic> userData;

//   @override
//   void initState() {
//     super.initState();
//     userData = {}; // Provide a default empty map
//     loadUserData();
//   }

//   Future<void> loadUserData() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection("users")
//           .doc(user.uid)
//           .get();

//       if (userSnapshot.exists) {
//         setState(() {
//           currentUser = user;
//           userData = userSnapshot.data() as Map<String, dynamic>;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Center(
//         child: userData
//                 .isNotEmpty // Check if userData is not empty before accessing it
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Username: ${userData['username']}'),
//                   Text('Email: ${userData['useremail']}'),
//                   Text('Phone: ${userData['userphone']}'),
//                   Padding(
//                       padding: EdgeInsets.all(20),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text(
//                           'EditeProfile',
//                           style: TextStyle(fontSize: 15),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                             primary: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                       ))
//                   // You can add more user details as needed
//                 ],
//               )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
