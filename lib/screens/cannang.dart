import 'package:flutter/material.dart';
import 'package:gym_fit/screens/chieucao.dart';
import 'package:weight_slider/weight_slider.dart';
import 'dart:math';

import '../utils/colors_util.dart';

class CanNangSrceen extends StatefulWidget {
  const CanNangSrceen({super.key});
  static const routeName = '/cannang';

  @override
  State<CanNangSrceen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CanNangSrceen> {
  double _sliderValue = 70.0;
  double roundDouble(double value, int places) {
    num mod = pow(_sliderValue, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor('41413f'),
              hexStringToColor('777777'),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: 15, bottom: 10, right: 15, top: 50),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 30,
                right: 15,
                top: 10,
              ),
              child: Text(
                'Cân nặng',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 30,
                right: 15,
                top: 10,
              ),
              child: Text(
                'Cân nặng sẽ tính bằng kg. Đừng lo lắng bạn luôn có thể thay đổi nó sau trong phần Cài Đặt.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.yellow[700],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          _sliderValue.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 1.0,
                        ),
                        Text(
                          'kg',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.deepOrange,
                      inactiveTrackColor: Colors.black,
                      thumbColor: Colors.pink,
                      overlayColor: Colors.indigo.withOpacity(0.18),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 40.0),
                      activeTickMarkColor: Colors.blue,
                      inactiveTickMarkColor: Colors.white,
                      trackHeight: 11.0,
                      valueIndicatorColor: Colors.red,
                      valueIndicatorTextStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Slider(
                      min: 40.0,
                      max: 150.0,
                      divisions: 32,
                      value: _sliderValue,
                      label: _sliderValue.toString(),
                      activeColor: Colors.yellow[700],
                      inactiveColor: Colors.yellow,
                      onChanged: (double val) {
                        setState(() {
                          _sliderValue = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 240.0,
            ),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.yellowAccent,
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        'Quay lại',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          letterSpacing: 0.5,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ChieuCaoSrceen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.yellow,
                      ),
                      child: Text(
                        'Tiep Theo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          letterSpacing: 0.5,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
