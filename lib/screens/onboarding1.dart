import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gym_fit/screens/onboarding2.dart';

import '../utils/colors_util.dart';

class OnBoarding1Screen extends StatelessWidget {
  static const routeName = '/onboarding1';

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
            CircleAvatar(
              radius: 200,
              backgroundImage:
                  AssetImage('assets/images/onboarding/onboarding.png'),
            ),
            SizedBox(
              height: 40.0,
            ),
            Center(
                child: Text(
              'Chào mừng đến với',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            )),
            Center(
              child: Text(
                'FreeFit',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 3,
                position: 0,
                decorator: DotsDecorator(
                  spacing: const EdgeInsets.all(10.0),
                  activeColor: Colors.yellow,
                  size: const Size.square(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OnBoarding2Screen.routeName);
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
