import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/second.dart';
import 'package:flutter_application_1/shop.dart';
import 'package:flutter_application_1/shop3.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/workout.2.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cardclass.dart';
import 'cartauth.dart';
import 'firebase_options.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SignupPage()));
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

Future<void> initSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupPage(),
      ),
    );
  }
}
