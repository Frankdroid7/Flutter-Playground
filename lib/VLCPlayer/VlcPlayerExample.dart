import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter/material.dart';

class VlcPlayerExample extends StatefulWidget {
  @override
  VlcPlayerExampleState createState() => VlcPlayerExampleState();
}

class VlcPlayerExampleState extends State<VlcPlayerExample> {
  final String urlToStreamVideo =
      'https://player.vdocipher.com/playerAssets/1.x/vdo/embed/index.html#otp=20160313versUSE323Ir5ThdWA16pOLBkpdVKXajKaNKcT6YemJqfoLO6SGMgOTb&playbackInfo=eyJ2aWRlb0lkIjoiYTZmM2YyNmQ0NjFmNDM1OWJkN2IwY2VlNzlmOTVhODEifQ==';

  final VlcPlayerController controller = VlcPlayerController();

  final int playerWidth = 640;
  final int playerHeight = 360;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 640,
        width: 360,
        child: new VlcPlayer(
          aspectRatio: 16 / 9,
          url: urlToStreamVideo,
          controller: controller,
          placeholder: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
