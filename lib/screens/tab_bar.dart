import 'package:flutter/material.dart';
import 'package:gym_fit/screens/diary.dart';
import 'package:gym_fit/screens/khampha.dart';
import 'package:gym_fit/screens/onboarding1.dart';
import '../utils/colors_util.dart';
import './setting_user.dart';
import 'lichtap.dart';

class TabBarSrceen extends StatefulWidget {
  static const rountName = '/tabbar';
  @override
  State<TabBarSrceen> createState() => _TabBarSrceenState();
}

class _TabBarSrceenState extends State<TabBarSrceen> {
  @override
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': DiaryScreen(),
        'title': 'Nhật ký',
      },
      {
        'page': LichTapSrceen(),
        'title': 'Lịch tập',
      },
      {
        'page': KhamPhaSrceen(),
        'title': 'Khám phá',
      },
      {
        'page': SettingUserSrceen(),
        'title': 'Settings',
      },
      // {
      //   'page':,
      //   'title': ,
      // },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: hexStringToColor('777777'),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.book),
            label: 'Nhật ký',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Lịch Tập',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.explore_outlined),
            label: 'Khám phá',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
