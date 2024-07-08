import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: 'dh7rRIZCni0',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    // Listen to orientation changes
    youtubePlayerController.addListener(() {
      if (youtubePlayerController.value.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  @override
  void dispose() {
    // Reset preferred orientations on dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Reset preferred orientations when navigating back
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return true;
      },
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
          ),
        ),
      ),
    );
  }
}
