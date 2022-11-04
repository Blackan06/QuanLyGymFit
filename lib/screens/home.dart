import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:gym_fit/screens/muctieu.dart';
import '../screens/login.dart';
import '../services/firebase_services.dart';
import '../utils/colors_util.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 15,
            //     bottom: 60,
            //     right: 15,
            //     top: 0,
            //   ),
            //   child: CircleAvatar(
            //     radius: 100,
            //     child: Image.asset(
            //       "assets/images/Asset 7.png",
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 15,
            //     bottom: 60,
            //     right: 15,
            //     top: 0,
            //   ),
            //   child: CircleAvatar(
            //     radius: 100,
            //     child: Image.asset(
            //       "assets/images/Asset 4.png",
            //     ),
            //   ),
            // ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 100),
              alignment: Alignment.center,
              child: GenderPickerWithImage(
                maleImage: const AssetImage('assets/images/Asset 7.png'),
                femaleImage: const AssetImage('assets/images/Asset 4.png'),
                // to show what's selected on app opens, but by default it's Male
                selectedGender: Gender.Male,
                selectedGenderTextStyle: TextStyle(
                    color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
                unSelectedGenderTextStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
                onChanged: (Gender? gender) {
                  print(gender);
                },
                verticalAlignedText: true,
                //Alignment between icons
                equallyAligned: true,

                animationDuration: Duration(milliseconds: 300),
                isCircular: true,
                // default : true,
                opacityOfGradient: 0.4,
                padding: const EdgeInsets.all(3),
                size: 150, //default : 40
              ),
            ),
            SizedBox(
              height: 65.0,
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
