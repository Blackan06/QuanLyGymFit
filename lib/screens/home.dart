import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_fit/screens/muctieu.dart';
import '../screens/login.dart';
import '../services/firebase_services.dart';
import '../utils/colors_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                'Giới thiệu bản thân',
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
                'Để mang đến cho bạn trải nghiệm và kết quả tốt hơn, chúng tôi cần biết giới tính của bạn',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 30,
                right: 15,
              ),
              child: CircleAvatar(
                radius: 100,
                child: Image.asset(
                  "assets/images/Male.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 60,
                right: 15,
                top: 0,
              ),
              child: CircleAvatar(
                radius: 90,
                child: Image.asset(
                  "assets/images/Female.png",
                ),
              ),
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MuctieuScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
    );
  }
}
