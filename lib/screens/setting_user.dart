import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gym_fit/screens/editthongtincanhan.dart';
import '../utils/colors_util.dart';

class SettingUserSrceen extends StatefulWidget {
  static const rounteName = '/settinguser';

  @override
  State<SettingUserSrceen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SettingUserSrceen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              hexStringToColor('41413f'),
              hexStringToColor('777777'),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: <Widget>[
          SizedBox(
            height: 150,
            width: 115,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avater.jpg"),
                ),
                Positioned(
                  bottom: 0,
                  right: -25,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Color(0xFFF5F6F9),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Divider(
            height: 20,
            thickness: 2,
            indent: 30,
            endIndent: 30,
            color: Colors.yellow,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_box_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          EditThongTinCaNhanScreen.routeName,
                          arguments: userId);
                    },
                    child: Text(
                      'Chỉnh sửa thông tin cá nhân',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.mail_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Thông tin gói tập',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Thông báo',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                ),
                FlutterSwitch(
                    activeColor: Colors.yellow,
                    value: status,
                    onToggle: (value) {
                      setState(() {
                        status = value;
                      });
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.security_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Bảo mật',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Trợ giúp',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.language_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ngôn ngữ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Đăng xuất',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
