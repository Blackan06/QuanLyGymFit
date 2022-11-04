import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:gym_fit/screens/cannang.dart';
import 'package:numberpicker/numberpicker.dart';

import '../utils/colors_util.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});
  static const routeName = '/age';

  @override
  State<AgeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AgeScreen> {
  int _currentValue = 1990;
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
                'Năm sinh',
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
                'Tuổi tính theo năm. Điều này sẽ giúp chúng tôi cá nhân hóa một kế hoạch chương trình tập thể dục phù hợp với bạn.Đừng lo lắng bạn luôn có thể thay đổi nó sau trong phần Cài Đặt',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: NumberPicker(
                      maxValue: 2022,
                      minValue: 1800,
                      itemCount: 7,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                        });
                      },
                      value: _currentValue,
                      selectedTextStyle: TextStyle(
                        decoration: TextDecoration.combine([
                          TextDecoration.underline,
                        ]),
                        fontSize: 40,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                        color: Colors.yellow[700],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //     child: const Text('Age'),
            //     onPressed: () => showMaterialNumberPicker(
            //       context: context,
            //       title: 'Pick Your Age',
            //       maxNumber: 100,
            //       minNumber: 14,
            //       selectedNumber: _currentValue,
            //       onChanged: (value) => setState(() => _currentValue = value),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 80,
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
                            .pushNamed(CanNangSrceen.routeName);
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
