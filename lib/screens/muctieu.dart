import 'package:flutter/material.dart';
import '../screens/mucdohoatdong.dart';
import '../providers/checktitlemuctieu.dart';
import '../utils/colors_util.dart';

class MuctieuScreen extends StatefulWidget {
  static const routeName = '/muctieu';

  @override
  State<MuctieuScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MuctieuScreen> {
  final checkBoxList = [
    CheckTitleMuctieu(title: 'Lấy lại vóc dáng'),
    CheckTitleMuctieu(title: 'Tăng cân'),
    CheckTitleMuctieu(title: 'Giảm cân'),
    CheckTitleMuctieu(title: 'Xây dựng cơ bắp'),
    CheckTitleMuctieu(title: 'Cải thiện độ bền')
  ];
  void onAllClicked(CheckTitleMuctieu chkMT) {
    setState(() {
      chkMT.value = !chkMT.value;
    });
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
                'Mục tiêu',
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
                'Điều này sẽ giúp chúng tôi cá nhân hóa kế hoạch chương trình tập thể dục phù hợp với bạn. Bạn có thể chọn nhiều lần',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 450.0,
              width: 350.0,
              child: ListView(
                children: <Widget>[
                  ...checkBoxList
                      .map(
                        (item) => item.value
                            ? Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.grey, width: 3.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                margin: EdgeInsets.only(bottom: 20),
                                color: Colors.yellow,
                                child: CheckboxListTile(
                                  activeColor: Colors.black,
                                  checkColor: Colors.yellow,
                                  title: Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  side: BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 2.0,
                                  ),
                                  value: item.value,
                                  onChanged: (value) => onAllClicked(item),
                                ),
                              )
                            : Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.yellow, width: 3.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                margin: EdgeInsets.only(bottom: 20),
                                color: Colors.white,
                                child: CheckboxListTile(
                                  activeColor: Colors.black,
                                  checkColor: Colors.yellow,
                                  title: Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  side: BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 2.0,
                                  ),
                                  value: item.value,
                                  onChanged: (value) => onAllClicked(item),
                                ),
                              ),
                      )
                      .toList(),
                ],
              ),
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
                            .pushNamed(MucDoHoatDongSrceen.routeName);
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
