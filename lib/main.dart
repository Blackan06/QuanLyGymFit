import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_fit/screens/age.dart';
import 'package:gym_fit/screens/cannang.dart';
import './screens/muctieu.dart';
import './screens/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './screens/loading.dart';
import './screens/onboarding1.dart';
import './screens/mucdohoatdong.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        OnBoarding1Screen.routeName: (ctx) => OnBoarding1Screen(),
        MuctieuScreen.routeName: (ctx) => MuctieuScreen(),
        MucDoHoatDongSrceen.routeName: (ctx) => MucDoHoatDongSrceen(),
        AgeScreen.routeName: (ctx) => AgeScreen(),
        CanNangSrceen.routeName: (ctx) => CanNangSrceen(),
      },
    );
  }
}
