// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MyProfile2 extends StatefulWidget {
//   @override
//   State<MyProfile2> createState() => _MyProfile2State();
// }

// class _MyProfile2State extends State<MyProfile2> {
//   late User? currentUser;
//   late Map<String, dynamic>? userData;
//   late Future<void> profileDataFuture;

//   @override
//   void initState() {
//     super.initState();
//     currentUser = FirebaseAuth.instance.currentUser;
//     profileDataFuture = profileData();
//   }

//   Future<void> profileData() async {
//     if (currentUser != null) {
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection("users")
//           .doc(currentUser!.uid)
//           .get();
//       if (userSnapshot.exists) {
//         setState(() {
//           userData = userSnapshot.data() as Map<String, dynamic>;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           AppBar(backgroundColor: Colors.yellowAccent, title: Text("profile")),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: FutureBuilder(
//             future: profileDataFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error loading profile data'),
//                 );
//               } else if (currentUser == null) {
//                 // User not authenticated
//                 return Center(
//                   child: Text('User not authenticated'),
//                 );
//               } else {
//                 return Column(
//                   children: [
//                     EditProfile1(
//                       title: "Name",
//                       value: '${userData?['username'] ?? ""}',
//                       iconData: Icons.person,
//                     ),
//                     EditProfile1(
//                       title: "Email",
//                       value: '${userData?['useremail'] ?? ""}',
//                       iconData: Icons.email,
//                     ),
//                     EditProfile1(
//                       title: "Phone",
//                       value: '${userData?['userphone'] ?? ""}',
//                       iconData: Icons.phone,
//                     ),
//                   ],
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class EditProfile1 extends StatelessWidget {
//   final String title, value;
//   final IconData iconData;

//   const EditProfile1({
//     Key? key,
//     required this.title,
//     required this.value,
//     required this.iconData,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: Text(title),
//           trailing: Text(value),
//           leading: Icon(iconData),
//         ),
//         Divider(),
//       ],
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfileUpdatePage extends StatefulWidget {
  @override
  _UserProfileUpdatePageState createState() => _UserProfileUpdatePageState();
}

class _UserProfileUpdatePageState extends State<UserProfileUpdatePage> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load user data initially
    loadUserData();
  }

  Future<void> loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (userSnapshot.exists) {
        setState(() {
          _emailController.text = userSnapshot.get('useremail');
          _usernameController.text = userSnapshot.get('username');
          _phoneController.text = userSnapshot.get('userphone');
        });
      }
    }
  }

  Future<void> updateProfile() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      // Step 1: Update email in Firebase Authentication
      await user?.updateEmail(_emailController.text);

      // Step 2: Update user details in Firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({
        'username': _usernameController.text,
        'userphone': _phoneController.text,
      });

      // Load updated user data
      await loadUserData();

      // Show success message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Profile updated successfully!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert box
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Handle errors
      print('Error updating profile: $e');

      // Show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error updating profile. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert box
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'New Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'New Username'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'New Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateProfile();
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserProfileUpdatePage(),
  ));
}
