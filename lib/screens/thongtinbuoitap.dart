import 'package:flutter/material.dart';
import 'package:gym_fit/providers/funcitonBuoiTap.dart';
import 'package:gym_fit/providers/user.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class ThongTinBuoiTapSrceen extends StatefulWidget {
  @override
  State<ThongTinBuoiTapSrceen> createState() => _MyWidgetState();
}

bool _isInit = false;

class _MyWidgetState extends State<ThongTinBuoiTapSrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
  }
}
