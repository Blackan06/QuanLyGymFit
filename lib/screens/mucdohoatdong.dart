import 'package:flutter/material.dart';
import 'package:gym_fit/screens/age.dart';

class MucDoHoatDongSrceen extends StatefulWidget {
  const MucDoHoatDongSrceen({super.key});
  static const routeName = '/mucdo';

  @override
  State<MucDoHoatDongSrceen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MucDoHoatDongSrceen> {
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
                'Mức độ hoạt động',
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
                'Chọn mức độ hoạt động thường xuyên của bạn. Điều này sẽ giúp chúng tôi cá nhân hóa các kế hoạch của bạn',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sơ Cấp',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Trung Bình',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Nâng Cao',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(AgeScreen.routeName);
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
