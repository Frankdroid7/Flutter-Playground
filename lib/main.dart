import 'package:flutter/material.dart';
import 'package:flutter_playground/CustomPaintPlayground/CustomPaintAnimationPlayground.dart';
import 'CustomPaintPlayground/CustomPaintPlayground.dart';

void main() async {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaintAnimationPlayground();
  }
}
