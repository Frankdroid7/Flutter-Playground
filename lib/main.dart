import 'package:flutter/material.dart';
import 'package:flutter_playground/WebViewPlayground/WebViewPlayground.dart';

void main() => runApp(MaterialApp(home: MyApp()));

double deviceHeight;
double deviceWidth;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return WebViewPlayground();
  }
}
