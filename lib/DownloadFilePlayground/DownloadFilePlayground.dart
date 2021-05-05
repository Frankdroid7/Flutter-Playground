import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadFilePlayground extends StatefulWidget {
  @override
  _DownloadFilePlaygroundState createState() => _DownloadFilePlaygroundState();
}

class _DownloadFilePlaygroundState extends State<DownloadFilePlayground> {
  void getStoragePermissionAndDownloadPdf() async {
    Permission storagePermission = Permission.storage;
    if (!(await storagePermission.request().isGranted)) {
      await Permission.storage.request();
    } else {
      downloadPdf();
    }
  }

  downloadPdf() async {
    Directory storagePath = await getExternalStorageDirectory();

    await FlutterDownloader.enqueue(
      url:
          'https://8eecca5c-3cde-4e9e-81e7-df61f52aabe5.filesusr.com/ugd/f3fda3_f141767d5e8b46869f1fa9393c7c5c83.pdf',
      savedDir: storagePath.path,
      fileName: 'Flutter Cheat Sheet.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: () => getStoragePermissionAndDownloadPdf(),
                child: Text('Download Flutter Cheat Sheet pdf '),
              ),
              Text(
                'You will see the PDF file in your notifications bar.',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
