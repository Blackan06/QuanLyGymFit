import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ChieuCaoSrceen extends StatefulWidget {
  const ChieuCaoSrceen({super.key});
  static const routeName = '/chieucao';

  @override
  State<ChieuCaoSrceen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChieuCaoSrceen> {
  int _currentValue = 155;

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
                'Chiều cao',
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
                'Chiều cao sẽ tính bằng cm. Đừng lo lắng bạn luôn có thể thay đổi nó sau trong phần Cài Đặt',
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
                      maxValue: 200,
                      minValue: 150,
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
