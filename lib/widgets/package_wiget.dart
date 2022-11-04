import 'package:flutter/material.dart';
import 'package:gym_fit/models/excersice.dart';
import 'package:gym_fit/models/excersice_sets.dart';
import 'package:gym_fit/models/excersice_set.dart';
import 'package:gym_fit/providers/excersice_data.dart';

import 'exercise_set_widget.dart';

class PackageWiget extends StatefulWidget {
  @override
  State<PackageWiget> createState() => _PackageWigetState();
}

class _PackageWigetState extends State<PackageWiget> {
  ExerciseType selectedType = ExerciseType.low;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(18),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          SizedBox(
            height: 8,
          ),
          buildDifficultyLevel(),
          SizedBox(
            height: 8,
          ),
          buildWorkouts(),
        ]),
      ),
    );
  }

  Widget buildDifficultyLevel() {
    return Row(
      children: ExerciseType.values.map(
        (type) {
          final name = getExerciseName(type);
          final fontWeight =
              selectedType == type ? Colors.yellow : Colors.white;
          return Expanded(
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    selectedType = type;
                  });
                },
                child: Text(
                  name,
                  style: TextStyle(fontSize: 18, color: fontWeight),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget buildWorkouts() => GestureDetector(
        onHorizontalDragEnd: swipeFunction,
        child: Column(
          children: exerciseSets
              .where((element) => element.exerciseType == selectedType)
              .map(
                (exerciseSet) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ExerciseSetWidget(exerciseSet: exerciseSet)),
              )
              .toList(),
        ),
      );
  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = ExerciseType.values.indexOf(selectedType);
    final hasNext = selectedIndex < ExerciseType.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity! < 0 && hasNext) {
        final nextType = ExerciseType.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity! > 0 && hasNext) {
        final previousType = ExerciseType.values[selectedIndex + 1];
        selectedType = previousType;
      }
    });
  }
}
