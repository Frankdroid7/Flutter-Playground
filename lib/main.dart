import 'package:flutter/material.dart';
import 'package:flutter_playground/QRCodePlayground.dart';

void main() async {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter PlayGround"),
      ),
      body: QRCodePlayground(),
    );
  }
}
