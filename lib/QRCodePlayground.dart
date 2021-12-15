import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class QRCodePlayground extends StatefulWidget {
  @override
  _QRCodePlaygroundState createState() => _QRCodePlaygroundState();
}

class _QRCodePlaygroundState extends State<QRCodePlayground> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          tfController.text.isEmpty
              ? SizedBox.shrink()
              : Screenshot(
                  controller: screenshotController,
                  child: QrImage(data: tfController.text)),
          SizedBox(height: 20),
          TextField(
            controller: tfController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 20),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Generate QR Code'),
            onPressed: () => setState(() {}),
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          RaisedButton(
            onPressed: () {
              if (tfController.text.isEmpty) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Generate your QR code first')));
              } else {
                _shareQrCode();
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Share QR code'),
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        ],
      ),
    );
  }

  _shareQrCode() async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    final imageFile = await File('$directory/$fileName.png').create();
    screenshotController.capture().then((Uint8List image) async {
      if (image != null) {
        try {
          if (imageFile != null) {
            await imageFile.writeAsBytes(image);
            Share.shareFiles([imageFile.path]);
          }
        } catch (error) {}
      }
    }).catchError((onError) {
      print('Error --->> $onError');
    });
  }
}
