import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcPlayerExample extends StatefulWidget {
  @override
  VlcPlayerExampleState createState() => VlcPlayerExampleState();
}

class VlcPlayerExampleState extends State<VlcPlayerExample> {
  final String urlToStreamVideo =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  VlcPlayerController _vlcPlayerController;

  final int playerWidth = 640;
  final int playerHeight = 360;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController =
        VlcPlayerController(onInit: () => _vlcPlayerController.play());
  }

  @override
  void dispose() async {
    super.dispose();
    await _vlcPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 640,
        width: MediaQuery.of(context).size.width,
        child: VlcPlayer(
          aspectRatio: 16 / 9,
          url: urlToStreamVideo,
          controller: _vlcPlayerController,
          placeholder: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
