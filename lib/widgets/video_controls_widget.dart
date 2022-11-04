import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:gym_fit/models/excersice.dart';
import 'package:gym_fit/models/excersice_sets.dart';

import '../models/excersice_set.dart';

class VideoControlsWidget extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;

  VideoControlsWidget({
    required this.exercise,
    required this.onRewindVideo,
    required this.onNextVideo,
    required this.onTogglePlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.95),
      ),
      height: 142,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildText(
                title: 'Duration',
                value: '${exercise.duration.inSeconds} Seconds',
              ),
              buildText(
                title: 'Reps',
                value: '${exercise.noOfReps} times',
              )
            ],
          ),
          buildButtons(context),
        ],
      ),
    );
  }

  Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
        ],
      );
  Widget buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          onPressed: onRewindVideo,
          icon: Icon(
            Icons.fast_rewind,
            color: Colors.black87,
            size: 32,
          ),
        ),
        buildPlayButton(context),
        IconButton(
          onPressed: onNextVideo,
          icon: Icon(
            Icons.fast_forward,
            color: Colors.black87,
            size: 32,
          ),
        ),
      ],
    );
  }

  Widget buildPlayButton(BuildContext context) {
    final isLoading = exercise.controller == null ||
        !exercise.controller!.value.isInitialized;
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (exercise.controller!.value.isPlaying) {
      return buildButton(
        context,
        icon: Icon(
          Icons.pause,
          size: 30,
          color: Colors.white,
        ),
        onClicked: () {
          onTogglePlaying(false);
        },
      );
    } else {
      return buildButton(
        context,
        icon: Icon(
          Icons.play_arrow,
          size: 30,
          color: Colors.white,
        ),
        onClicked: () {
          onTogglePlaying(true);
        },
      );
    }
  }

  Widget buildButton(
    BuildContext context, {
    required Widget icon,
    required VoidCallback onClicked,
  }) =>
      GestureDetector(
        onTap: onClicked,
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0xFFff6369),
                  blurRadius: 8,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 24,
              child: icon,
            )),
      );
}
