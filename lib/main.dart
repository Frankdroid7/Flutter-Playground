import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_playground/BottomSheetPlayground/BottomSheetPlayground.dart';
import 'package:flutter_playground/GooglePlacesApiPlayground/GooglePlacesApiPlayground.dart';
import 'package:flutter_playground/GraphQLPlayground/GraphQLPlayground.dart';
import 'package:flutter_playground/NetworkPlayground/NetworkPlayGround.dart';
import 'package:flutter_playground/VLCPlayer/VlcPlayerExample.dart';
import 'BluetoothPrinterPlayground/BluetoothPrinterPlayground.dart';
import 'CustomPaintPlayground/CustomPaintPlayground.dart';
import 'DownloadFilePlayground/DownloadFilePlayground.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
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
      body: GraphQLPlayground(),
    );
  }
}
