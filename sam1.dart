// // import 'package:flutter/material.dart';
// // // import 'package:flutter_application_1/project.dart/auth.dart';
// // import 'package:get/get.dart';

// // import 'auth.dart';

// // class SignupPage extends StatefulWidget {
// //   @override
// //   State<SignupPage> createState() {
// //     return SignupPageState();
// //   }
// // }

// // class SignupPageState extends State<SignupPage> {
// //   final ctrl = Get.put(Authcontroller());
// //   // final TextEditingController email = TextEditingController();
// //   // final TextEditingController password = TextEditingController();
// //   final TextEditingController conform = TextEditingController();
// //   // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         titleSpacing: 100,
// //         title: Text(
// //           'Signup',
// //           style: TextStyle(fontSize: 20),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           // key: _formKey,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               Text(
// //                 'SIGNUP',
// //                 style: TextStyle(
// //                   fontSize: 30,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //                 textAlign: TextAlign.center,
// //               ),
// //               SizedBox(height: 20),
// //               TextFormField(
// //                 controller: ctrl.username,
// //                 decoration: InputDecoration(
// //                   labelText: "Email",
// //                 ),
// //               ),
// //               TextFormField(
// //                 controller: ctrl.email,
// //                 onChanged: (value) => setState(() {}),
// //                 // validator: (value) {
// //                 //   return validateEmail(value);
// //                 // },
// //                 decoration: InputDecoration(
// //                   labelText: "Email",
// //                   prefixIcon: Icon(Icons.email),
// //                   // errorText: validateEmail(ct),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               TextFormField(
// //                 controller: ctrl.password,
// //                 obscureText: true,
// //                 onChanged: (value) => setState(() {}),
// //                 decoration: InputDecoration(
// //                   labelText: 'Password',
// //                   prefixIcon: Icon(Icons.lock),
// //                   // errorText: validatePassword(password.text),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               TextFormField(
// //                 controller: conform,
// //                 obscureText: true,
// //                 // validator: (value) {
// //                 //   return validateConfirmPassword(
// //                 //       value, ctrl.password as String?);
// //                 // },
// //                 decoration: InputDecoration(
// //                   labelText: 'Confirm Password',
// //                   prefixIcon: Icon(Icons.lock),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   ctrl.sigin();
// //                   // if (_formKey.currentState!.validate()) {
// //                   // Navigator.of(context).pop();

// //                   // }
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   primary: Colors.red,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //                 child: Obx(() => Container(
// //                     decoration: BoxDecoration(color: Colors.blue.shade100),
// //                     child: ctrl.loading.value
// //                         ? CircularProgressIndicator(
// //                             color: Colors.white,
// //                           )
// //                         : Text("signup"))),
// //               )
// //               //   Text(

// //               //     'Signup',
// //               //     style: TextStyle(
// //               //       fontSize: 18,
// //               //     ),
// //               //   ),
// //               // ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //   String? validateEmail(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return 'Please enter an email address';
// //     } else if (!value.contains("@")) {
// //       return 'Invalid Email';
// //     }
// //     return null;
// //   }

// //   String? validatePassword(String? value) {
// //     if (value == null || value.length < 6) {
// //       return 'Please enter at least 6 characters for the password';
// //     }
// //     return null;
// //   }

// //   String? validateConfirmPassword(String? value, String? passwordValue) {
// //     if (value == null || value.isEmpty) {
// //       return 'Please confirm your password';
// //     } else if (value != passwordValue) {
// //       return 'Passwords do not match';
// //     }
// //     return null;
// //   }
// // }

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/shop.dart';
// import 'package:get/get.dart';

// import 'auth.dart';

// class SignupPage extends StatefulWidget {
//   @override
//   State<SignupPage> createState() {
//     return SignupPageState();
//   }
// }

// class SignupPageState extends State<SignupPage> {
//   TextEditingController usernamecontroller = TextEditingController();
//   TextEditingController userEmailcontroller = TextEditingController();
//   TextEditingController userPasswordcontroller = TextEditingController();
//   TextEditingController userphonenumbercontroller = TextEditingController();
//   User? currrentUser = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         titleSpacing: 100,
//         title: Text(
//           'Signup',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'SIGNUP',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: usernamecontroller,
//                   onChanged: (Value) => setState(() {}),
//                   decoration: InputDecoration(
//                       errorText: usernamevalidate(usernamecontroller.text),
//                       labelText: "Username",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20))),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: userphonenumbercontroller,
//                   onChanged: (Value) => setState(() {}),
//                   decoration: InputDecoration(
//                       errorText: phonenume(userphonenumbercontroller.text),
//                       labelText: "phonenumber",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20))),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: userEmailcontroller,
//                   onChanged: (value) => setState(() {}),
//                   // validator: (value) {
//                   //   return validateEmail(value);
//                   // },
//                   decoration: InputDecoration(
//                     errorText: validateEmail(userEmailcontroller.text),
//                     labelText: "Email",
//                     prefixIcon: Icon(Icons.email),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: userPasswordcontroller,
//                   obscureText: true,
//                   onChanged: (value) => setState(() {}),
//                   decoration: InputDecoration(
//                     errorText: validatepassword(userPasswordcontroller.text),
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.lock),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // TextFormField(
//                 //   controller: conform,
//                 //   obscureText: true,
//                 //   validator: (value) {
//                 //     return validateConfirmPassword(value, ctrl.password.text);
//                 //   },
//                 //   decoration: InputDecoration(
//                 //     labelText: 'Confirm Password',
//                 //     prefixIcon: Icon(Icons.lock),
//                 //     border: OutlineInputBorder(
//                 //       borderRadius: BorderRadius.circular(20),
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                     onPressed: () async {
//                       // if (ctrl.sigin().currentState!.validate()) {
//                       //   ctrl.sigin();
//                       // }

//                       var username = usernamecontroller.text.trim();
//                       var useremail = userEmailcontroller.text.trim();
//                       var userpassword = userPasswordcontroller.text.trim();
//                       FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
                            
//                               email: useremail, password: userpassword)
//                           .then((value) {
//                         print('User created');
//                         FirebaseFirestore.instance
//                             .collection("users")
//                             .doc(currrentUser?.uid)
//                             .set({
//                           'username': username,
//                           'useremail': useremail,
//                           'createAt': DateTime.now(),
//                           "UsrID": currrentUser?.uid,
//                         });
//                       });
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Iphone13()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: Text(
//                       "SIGNUP",
//                       style: TextStyle(fontSize: 15),
//                     )),
//               ]),
//         ),
//       ),
//     );
//   }
// }

// String? validateEmail(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter an email address';
//   } else if (!value.contains("@")) {
//     return 'Invalid Email';
//   }
//   return null;
// }

// String? validatepassword(String? value) {
//   if (value == null || value.length < 5) {
//     return "Enter the password more 5  ";
//   }
// }

// String? validateConfirmPassword(String? value, String? passwordValue) {
//   if (value == null || value.isEmpty) {
//     return 'Please confirm your password';
//   } else if (value != passwordValue) {
//     return 'Passwords do not match';
//   }
//   return null;
// }

// String? usernamevalidate(String? value) {
//   if (value == null || value.isEmpty) {
//     return " Please Enter Name ";
//   } else {
//     return null;
//   }
// }

// String? phonenume(String? value) {
//   if (value?.length == 10) {
//     return null;
//   } else {
//     return "enter more number";
//   }
// }
