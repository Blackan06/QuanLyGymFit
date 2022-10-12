import 'package:flutter/material.dart';
import 'package:gym_fit/screens/login.dart';
import '../screens/loading.dart';
import '../utils/colors_util.dart';
import '../widgets/OnbordingButton_Widger.dart';
import '../widgets/ImageOnbordingButton.dart';

class OnBoarding1Screen extends StatefulWidget {
  static const routeName = '/onboarding1';

  @override
  State<OnBoarding1Screen> createState() => _OnBoarding1ScreenState();
}

class _OnBoarding1ScreenState extends State<OnBoarding1Screen> {
  final _imageText = const [
    {
      'imageText': "assets/images/Login.png",
    },
    {
      'imageText': "assets/images/MuayThai.jpg",
    },
    {
      'imageText': "assets/images/MuayThai1.jpg",
    },
    {
      'imageText': "assets/images/MuayThai1.jpg",
    },
  ];
  bool _isPassed = false;
  int imageText = 0;
  void _chooseButton() {
    setState(() {
      _isPassed = true;
      imageText += 1;
    });
    if (imageText == 3) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      _isPassed = false;
    }
  }

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
            imageText < _imageText.length
                ? ImageOnboarding(
                    nextImage: _chooseButton,
                    imageOnbording: _imageText,
                    questionIndex: imageText,
                  )
                : ImageOnboarding(
                    nextImage: _chooseButton,
                    imageOnbording: _imageText,
                    questionIndex: imageText,
                  ),
            SizedBox(
              height: 190,
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: _chooseButton,
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
