import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gym_fit/screens/home.dart';
import '../utils/colors_util.dart';

class OnBoarding3Screen extends StatelessWidget {
  static const routeName = '/onboarding3';

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
                  AssetImage('assets/images/onboarding/onboarding_3.png'),
            ),
            SizedBox(
              height: 60.0,
            ),
            Text(
              'Cardio',
              style: TextStyle(
                fontSize: 40,
                color: Colors.yellow[700],
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 3,
                position: 2,
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
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
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
