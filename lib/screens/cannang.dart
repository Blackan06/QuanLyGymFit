import 'package:flutter/material.dart';
import 'package:weight_slider/weight_slider.dart';

class CanNangSrceen extends StatefulWidget {
  const CanNangSrceen({super.key});
  static const routeName = '/cannang';

  @override
  State<CanNangSrceen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CanNangSrceen> {
  double _sliderValue = 150.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    _sliderValue.round().toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'kg',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                overlayShape: RoundSliderOverlayShape(overlayRadius: 40.0),
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
                max: 220.0,
                divisions: 32,
                value: _sliderValue,
                label: _sliderValue.toString(),
                activeColor: Colors.deepOrange,
                inactiveColor: Colors.black,
                onChanged: (double val) {
                  setState(() {
                    _sliderValue = val;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.white,
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
                  ElevatedButton(
                    onPressed: () {},
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
