import 'package:flutter/material.dart';
import 'package:gym_fit/screens/age.dart';

import '../utils/colors_util.dart';

class MucDoHoatDongSrceen extends StatefulWidget {
  const MucDoHoatDongSrceen({super.key});
  static const routeName = '/mucdo';

  @override
  State<MucDoHoatDongSrceen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MucDoHoatDongSrceen> {
  var _isChangeSoCap = false;
  var _isChangeTrungBinh = false;
  var _isChangeNangCao = false;
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
                SizedBox(
                  width: 300,
                  height: 60,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(
                        color:
                            _isChangeSoCap ? Colors.grey : Colors.yellowAccent,
                        width: 3.0,
                      ),
                      backgroundColor:
                          _isChangeSoCap ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isChangeSoCap = !_isChangeSoCap;
                        if (_isChangeSoCap == true) {
                          _isChangeTrungBinh = false;
                          _isChangeNangCao = false;
                        }
                      });
                    },
                    child: Text(
                      'Sơ Cấp',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(
                        color: _isChangeTrungBinh
                            ? Colors.grey
                            : Colors.yellowAccent,
                        width: 3.0,
                      ),
                      backgroundColor:
                          _isChangeTrungBinh ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isChangeTrungBinh = !_isChangeTrungBinh;
                        if (_isChangeTrungBinh == true) {
                          _isChangeSoCap = false;
                          _isChangeNangCao = false;
                        } else if (_isChangeTrungBinh == false) {
                          if (_isChangeSoCap == true) {
                            _isChangeTrungBinh = false;
                          } else {
                            _isChangeTrungBinh = true;
                          }
                        }
                      });
                    },
                    child: Text(
                      'Trung bình',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(
                        color: _isChangeNangCao
                            ? Colors.grey
                            : Colors.yellowAccent,
                        width: 3.0,
                      ),
                      backgroundColor:
                          _isChangeNangCao ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isChangeNangCao = !_isChangeNangCao;
                        if (_isChangeNangCao == true) {
                          _isChangeTrungBinh = false;
                          _isChangeSoCap = false;
                        } else if (_isChangeNangCao == false) {
                          if (_isChangeSoCap == true) {
                            _isChangeTrungBinh = false;
                          } else {
                            _isChangeTrungBinh = true;
                          }
                        }
                      });
                    },
                    child: Text(
                      'Nâng Cao',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 30,
                right: 15,
                top: 50,
              ),
              child: Text(
                'Nhấn vào BỎ QUA để bỏ qua những câu hỏi sau đó. Đừng lo lắng bạn luôn có thể cập nhật và thay đổi nó sau trong phần Cài Đặt.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
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
