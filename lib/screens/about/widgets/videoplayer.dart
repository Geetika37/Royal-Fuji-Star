import 'package:flutter/widgets.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController youtubePlayerController = YoutubePlayerController(
    initialVideoId: 'dh7rRIZCni0',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenWidth * 0.6,
        child: YoutubePlayer(
          controller: youtubePlayerController,
        ),
      ),
    );
  }
}
