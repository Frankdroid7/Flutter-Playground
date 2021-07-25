import 'package:flutter/material.dart';
import 'BluetoothPrinterPlayground/BluetoothPrinterPlayground.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BluetoothPrinterPlayground();
  }
}
