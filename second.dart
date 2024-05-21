import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';

class second extends StatefulWidget {
  @override
  State<second> createState() {
    return splash();
  }
}

class splash extends State<second> {
  @override
  
  Widget build(BuildContext context) {
    return Container(
      width: 428,
      height: 870,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xEFACDCC5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -23,
            top: 263,
            child: Container(
              width: 512,
              height: 512,
             child: Lottie.network("https://lottie.host/40694d92-0de5-4ab4-8d71-9eb68df22066/kNduCOrnZu.json")
              ),
            ),
          
          Positioned(
            left: 19,
            top: 62,
            child: SizedBox(
              width: 390,
              height: 113,
              child: Text(
                ' explore the new world of clothing',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontFamily: 'Play',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 363,
            top: 9,
            child: Container(
              width: 38,
              height: 53,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/38x53"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            left: 300,
            top: 20,
            child: Container(
              width: 82,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/82x31"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
