import 'package:flutter/material.dart';
import 'package:gym_fit/models/excersice.dart';
import 'package:gym_fit/models/excersice_set.dart';
import 'package:gym_fit/screens/khampha.dart';
import 'package:gym_fit/screens/tab_bar.dart';
import 'package:gym_fit/widgets/exercise_set_widget.dart';

import '../models/excersice_sets.dart';
import '../utils/colors_util.dart';

class WinSrceen extends StatefulWidget {
  final ExerciseSet exerciseSet;
  final Exercise exercise;
  const WinSrceen({required this.exerciseSet, required this.exercise});

  @override
  State<WinSrceen> createState() => _WinSrceenState();
}

class _WinSrceenState extends State<WinSrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              hexStringToColor('41413f'),
              hexStringToColor('777777'),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SizedBox(
          width: 600,
          child: Column(children: <Widget>[
            Image.asset('assets/images/win.png'),
            SizedBox(
              height: 10,
            ),
            Text(
              'Chúc Mừng',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Bạn đã hoàn thành xong bài tập '),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(
                    color: Colors.yellow, width: 2, style: BorderStyle.solid)),
                gradient: LinearGradient(
                  colors: [
                    hexStringToColor('41413f'),
                    hexStringToColor('777777'),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Mức độ\n\n ${getExerciseName(widget.exerciseSet.exerciseType)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VerticalDivider(
                    color: Colors.yellow,
                    thickness: 2,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Thời gian\n\n ${widget.exerciseSet.totalDuration}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VerticalDivider(
                    color: Colors.yellow,
                    thickness: 2,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Calo\n\n ${widget.exerciseSet.totalCalo} Kcals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 370,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.yellow,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(TabBarSrceen.rountName);
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Center(
                        child: Text(
                          'Khám phá bài tập mới',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 370,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(hexStringToColor('777777')),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.yellow,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 85),
                      child: Center(
                        child: Text(
                          'Nhật ký bản thân',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
