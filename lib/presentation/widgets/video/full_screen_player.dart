import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  
  final String url;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.url,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.url)
    ..setVolume(0)
    ..setLooping(true)
    ..play();
    super.initState();
  }

  /* evitar que el video se siga reproduciendo cuando ya no lo estamos viendo */
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        return const Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        );
      },
    );
  }
}