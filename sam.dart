import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userss2 {
  late String username;
  late String email;
  late String password;

  Userss2({
    required this.username,
    required this.email,
    required this.password,
  });
}

class UserDetailsPage extends StatelessWidget {
  final Userss2 user;

  UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<Userss2?>(
        future: getUserDetails(), // Implement this method to get the user details
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            Userss2 userDetails = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${userDetails.username}'),
                Text('Email: ${userDetails.email}'),
                Text('Password: ${userDetails.password}'),
              ],
            );
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }

  // Implement this method to get the user details from Firestore or any other source
  Future<Userss2?> getUserDetails() async {
    try {
      // Replace this with your actual implementation to fetch user details
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();

      if (snapshot.exists) {
        return Userss2(
          username: snapshot['username'],
          email: snapshot['useremail'],
          password: '', // Password may not be stored in plaintext in Firestore
        );
      } else {
        return null; // Handle the case when user details are not found
      }
    } catch (e) {
      print('Error fetching user details: $e');
      return null;
    }
  }
}
