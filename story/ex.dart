import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

// class con extends StatefulWidget {
//   @override
//   State<con> createState() => container1();
// }

// class container1 extends State<con> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//              color: Colors.blueAccent,         )
//         ],
//       ),
//     );
//   }
// }
void main(List<String> args) {
  runApp(MaterialApp(home: CustomContainer(child: ExampleWidget()),));
}



class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  final EdgeInsets padding;

  const CustomContainer({
    Key? key,
    required this.child,
    this.color = Colors.blue,
    this.width = 200.0,
    this.height = 100.0,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      color: color,
      child: child,
    );
  }
}


class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Text('Hello, Custom Container!'),
      color: Colors.green,
      width: 250.0,
      height: 120.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    );
  }
}

