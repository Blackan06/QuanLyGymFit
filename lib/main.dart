import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_fit/providers/funcitonBuoiTap.dart';
import 'package:gym_fit/providers/functionthucan.dart';
import 'package:gym_fit/providers/functionuser.dart';
import 'package:gym_fit/providers/user.dart';
import 'package:gym_fit/screens/age.dart';
import 'package:gym_fit/screens/cannang.dart';
import 'package:gym_fit/screens/chieucao.dart';
import 'package:gym_fit/screens/editthongtincanhan.dart';
import 'package:gym_fit/screens/excersice_page.dart';
import 'package:gym_fit/screens/home.dart';
import 'package:gym_fit/screens/khampha.dart';
import 'package:gym_fit/screens/lichtap.dart';
import 'package:gym_fit/screens/onboarding2.dart';
import 'package:gym_fit/screens/onboarding3.dart';
import 'package:gym_fit/screens/setting_user.dart';
import 'package:gym_fit/screens/splash_srceen.dart';
import 'package:gym_fit/screens/tab_bar.dart';
import 'package:gym_fit/screens/thongtincanhan.dart';
import 'package:gym_fit/screens/win_exercise.dart';
import 'package:provider/provider.dart';
import './screens/muctieu.dart';
import './screens/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './screens/loading.dart';
import './screens/onboarding1.dart';
import './screens/mucdohoatdong.dart';
import './screens/diary.dart';
import './screens/thongtinthucan.dart';
import 'providers/auth.dart';
import './screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => Users(),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodToday(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => BuoiTaps(),
        // ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? LoadingScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthSrceen(),
                ),
          routes: {
            // LoginScreen.routeName: (ctx) => LoginScreen(),
            OnBoarding1Screen.routeName: (ctx) => OnBoarding1Screen(),
            MuctieuScreen.routeName: (ctx) => MuctieuScreen(),
            MucDoHoatDongSrceen.routeName: (ctx) => MucDoHoatDongSrceen(),
            AgeScreen.routeName: (ctx) => AgeScreen(),
            CanNangSrceen.routeName: (ctx) => CanNangSrceen(),
            ChieuCaoSrceen.routeName: (ctx) => ChieuCaoSrceen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            UserAddDataScreen.routeName: (ctx) => UserAddDataScreen(),
            OnBoarding2Screen.routeName: (ctx) => OnBoarding2Screen(),
            OnBoarding3Screen.routeName: (ctx) => OnBoarding3Screen(),
            DiaryScreen.routeName: (ctx) => DiaryScreen(),
            TabBarSrceen.rountName: (ctx) => TabBarSrceen(),
            ThongTinChiTietThucAnSrceen.routeName: (ctx) =>
                ThongTinChiTietThucAnSrceen(),
            SettingUserSrceen.rounteName: (ctx) => SettingUserSrceen(),
            EditThongTinCaNhanScreen.routeName: (ctx) =>
                EditThongTinCaNhanScreen(),
            KhamPhaSrceen.routeName: (ctx) => KhamPhaSrceen(),
            LichTapSrceen.rounteName: (ctx) => LichTapSrceen(),
          },
        ),
      ),
    );
  }
}
