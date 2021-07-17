import 'package:flutter/material.dart';
import 'NetworkPlayground/NetworkPlayGround.dart';

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
    return NetworkPlayground();
  }
}
