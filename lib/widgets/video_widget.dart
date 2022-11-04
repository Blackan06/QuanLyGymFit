import 'package:flutter/material.dart';
import 'package:gym_fit/models/excersice.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final Exercise exercise;
  final VoidCallback onInitialized;

  const VideoWidget({
    required this.exercise,
    required this.onInitialized,
  });
  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset(widget.exercise.videoUrl)
      ..initialize().then((value) {
        controller.setLooping(true);
        controller.play();

        widget.exercise.controller = controller;
        widget.onInitialized();
      });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: controller.value.isInitialized
            ? VideoPlayer(controller)
            : Center(child: CircularProgressIndicator()),
      );
}
