import 'package:flutter/material.dart';
import 'package:flutter_playground/BottomSheetPlayground/BottomSheetPlayground.dart';
import 'package:flutter_playground/VLCPlayer/VlcPlayerExample.dart';
import 'package:flutter_playground/WebView/WebView.dart';
import 'package:flutter_playground/WebView/WebView.dart';

void main() => runApp(MaterialApp(home: MyApp()));

double deviceHeight;
double deviceWidth;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return BottomSheetPlayground();
  }
}
