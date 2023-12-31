import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/presentation/widgets/shared/video_buttons.dart';
import 'package:tiktok/presentation/widgets/video/full_screen_player.dart';

class VideoScrollable extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollable({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    /* return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(color: Colors.amber,),
        Container(color: Colors.red,),
        Container(color: Colors.blue,),
        Container(color: Colors.green,),
        Container(color: Colors.pink,),
        Container(color: Colors.purple,),
        Container(color: Colors.teal,),
      ],
    ); */
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            // video player 
            SizedBox.expand(
              child: FullScreenPlayer(url: videoPost.videoUrl, caption: videoPost.caption, ),
            ),
            // buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            )
          ],
        );
      },
    );
  }
}
