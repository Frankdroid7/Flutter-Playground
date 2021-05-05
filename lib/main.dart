import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'DownloadFilePlayground/DownloadFilePlayground.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(MaterialApp(home: MyApp()));
}

double deviceHeight;
double deviceWidth;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return DownloadFilePlayground();
  }
}
