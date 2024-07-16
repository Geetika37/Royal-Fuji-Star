// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoPlayer extends StatefulWidget {
//   const VideoPlayer({super.key});

//   @override
//   State<VideoPlayer> createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoPlayer> {
//   late YoutubePlayerController youtubePlayerController;

//   @override
//   void initState() {
//     super.initState();
//     youtubePlayerController = YoutubePlayerController(
//       initialVideoId: 'dh7rRIZCni0',
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: true,
//       ),
//     );

//     // Listen to orientation changes
//     youtubePlayerController.addListener(() {
//       if (youtubePlayerController.value.isFullScreen) {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.landscapeLeft,
//           DeviceOrientation.landscapeRight,
//         ]);
//       } else {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.portraitUp,
//         ]);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // Reset preferred orientations on dispose
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]);
//     youtubePlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: deprecated_member_use
//     return WillPopScope(
//       onWillPop: () async {
//         // Reset preferred orientations when navigating back
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.portraitUp,
//         ]);
//         return true;
//       },
//       child: Center(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: YoutubePlayer(
//             controller: youtubePlayerController,
//             showVideoProgressIndicator: true,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royal_fuji_star/constants/size.dart';
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
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  @override
  void dispose() {
    // Reset preferred orientations and system UI on dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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
        // Reset preferred orientations and system UI when navigating back
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return true;
      },
      child: Scaffold(
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Stack(
              children: [
                // Black background
                // Container(
                //   color: orientation == Orientation.landscape
                //       ? Colors.black
                //       : Colors.white,
                // ),
                // Center the video player
                Center(
                  child: SizedBox(
                    width: orientation == Orientation.landscape
                        ? ScreenSize.getWidth(context)
                        : MediaQuery.sizeOf(context).width,
                    height: orientation == Orientation.landscape
                        ? MediaQuery.sizeOf(context).height * 0.5
                        : MediaQuery.sizeOf(context).height * 0.5,
                    child: YoutubePlayer(
                      // aspectRatio: 16 / 7,
                      controller: youtubePlayerController,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
