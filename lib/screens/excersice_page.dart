import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_fit/screens/diary.dart';
import 'package:gym_fit/screens/tab_bar.dart';
import 'package:gym_fit/screens/win_exercise.dart';
import 'package:video_player/video_player.dart';

import '../models/excersice.dart';
import '../models/excersice_set.dart';
import '../widgets/video_controls_widget.dart';
import '../widgets/video_widget.dart';

class ExcersicePageScreen extends StatefulWidget {
  static const rounteName = '/exercisepage';
  final ExerciseSet exerciseSet;

  ExcersicePageScreen({required this.exerciseSet});

  @override
  State<ExcersicePageScreen> createState() => _ExcersicePageScreenState();
}

class _ExcersicePageScreenState extends State<ExcersicePageScreen> {
  final controller = PageController();

  late Exercise currentExercise;

  get exerciseSet => widget.exerciseSet;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentExercise = widget.exerciseSet.exercises.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(currentExercise.name),
        centerTitle: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          buildVideo(),
          Positioned(
            bottom: 20,
            right: 50,
            left: 50,
            child: buildVideoController(),
          ),
        ],
      ),
    );
  }

  Widget buildVideo() => PageView(
        controller: controller,
        onPageChanged: (index) => setState(() {
          currentExercise = widget.exerciseSet.exercises[index];
          if (currentExercise == widget.exerciseSet.exercises.last) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WinSrceen(
                      exerciseSet: exerciseSet,
                      exercise: currentExercise,
                    )));
          }
        }),
        children: widget.exerciseSet.exercises
            .map((e) => VideoWidget(
                  exercise: e,
                  onInitialized: () => setState(() {}),
                ))
            .toList(),
      );
  Widget buildVideoController() => VideoControlsWidget(
        exercise: currentExercise,
        onTogglePlaying: (isPlaying) {
          setState(() {
            if (isPlaying) {
              currentExercise.controller?.play();
            } else {
              currentExercise.controller?.pause();
            }
          });
        },
        onNextVideo: () {
          controller.nextPage(
            duration: Duration(microseconds: 300),
            curve: Curves.easeIn,
          );
        },
        onRewindVideo: () {
          controller.previousPage(
            duration: Duration(microseconds: 300),
            curve: Curves.easeIn,
          );
        },
      );
}
