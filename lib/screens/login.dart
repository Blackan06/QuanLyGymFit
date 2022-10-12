import 'package:flutter/material.dart';
import '../utils/colors_util.dart';
import '../services/firebase_services.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final colorBlueShade100 = Colors.blue.shade100;
  var checkValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("000000"),
              hexStringToColor("767674"),
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
              child: Text(
                'Đăng Nhập',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xFFFFD54F),
                  fontFamily: 'OpenSans',
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 60,
                right: 15,
                top: 40,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/weightlifter.png'),
                radius: 100,
                backgroundColor: Colors.grey.shade800,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 38),
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseServices().signInWithGoogle();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: MaterialStateProperty.resolveWith(
                    //   (states) {
                    //     if (states.contains(MaterialState.pressed)) {
                    //       return Colors.blue;
                    //     }
                    //     return Colors.white;
                    //   },
                    // ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: Colors.blue.shade300,

                    // backgroundColor:
                    //     MaterialStatePropertyAll<Color>(Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 48,
                            width: 48,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Sign in with gmail",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: checkValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkValue = value!;
                    });
                  },
                  checkColor: Colors.yellow,
                  activeColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Tôi đồng ý với Điều kiện và Chính sách quyền riêng tư',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
