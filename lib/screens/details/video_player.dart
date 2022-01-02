// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayerController? videoPlayerController;
  bool? isLoop;

  VideoPlayer({this.videoPlayerController, this.isLoop});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController? chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController:
          widget.videoPlayerController as VideoPlayerController,
      looping: widget.isLoop as bool,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Chewie(
        controller: chewieController as ChewieController,
      ),
    );
  }
}

class VideoDisplay extends StatefulWidget {
  final String videoUrl;
  VideoDisplay({required this.videoUrl});

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(
      isLoop: true,
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
    );
  }
}
