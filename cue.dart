// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_application_1/forgotpassword.dart';
// import 'package:flutter_application_1/home.dart';
// import 'package:flutter_application_1/shop3.dart';
// // import 'package:flutter_application_1/newone/forgotpassword.dart';
// // import 'package:flutter_application_1/project.dart/signuppage.dart';
// import 'package:flutter_application_1/signup.dart';
// import 'package:get/get.dart';

// class Iphone13 extends StatefulWidget {
//   @override
//   State<Iphone13> createState() => _Iphone13State();
// }

// String email = '';
// String password = '';

// class _Iphone13State extends State<Iphone13> {
//   TextEditingController loginEmail = TextEditingController();
//   TextEditingController loginpassword = TextEditingController();
//   TextEditingController phonenumber = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   usersignup() async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Shop1()));
//     } on FirebaseException catch (e) {
//       if (e.code == 'user -not-found') {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("no user found that email")));
//       } else if (e.code == "wrong password") {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('wrog password provide usert')));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey, // Associate the form key with the Form widget
//         child: Column(
//           children: [
//             Container(
//               child: Image.asset(
//                 "assets/g.jpg",
//                 width: 500,
//                 height: 400,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(30),
//               child: TextFormField(
//                 controller: loginEmail,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (!(value.toString().contains("@"))) {
//                     return 'Invalid Email';
//                   } else {
//                     return null;
//                   }
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: TextFormField(
//                 controller: loginpassword,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   prefixIcon: Icon(Icons.lock),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.length < 5) {
//                     return 'Enter Password';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(right: 20, left: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ForgotPassword(),
//                           ));
//                     },
//                     child: Text("Forgotten Password ?"),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               width: 300,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // // Validate the form
//                   if (_formKey.currentState!.validate()) {
//                     setState(() {
//                       email = loginEmail.text.trim();
//                       password = loginpassword.text.trim();
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => Shop1()));
//                     });
//                   }
//                   usersignup();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 ),
//                 child: Text('Login'),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 150,
//                 ),
//                 Text(
//                   "Don't have an account?",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     primary: Color.fromARGB(255, 141, 197, 78),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => SignupPage()));
//                   },
//                   child: Text('Sign Up'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
