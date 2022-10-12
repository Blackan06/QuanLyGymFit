import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../screens/onboarding1.dart';
import '../utils/colors_util.dart';

class LoadingScreen extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
    shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    shadowColor: Colors.lightBlue,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("FFFFFF"),
              hexStringToColor("BBC6C8"),
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
                bottom: 60,
                right: 15,
                top: 40,
              ),
              child: Image.asset(
                "assets/images/logo.png",
                height: 310,
                width: 400,
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OnBoarding1Screen.routeName);
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
                  'Bat Dau',
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
