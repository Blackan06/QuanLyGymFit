import 'package:flutter/material.dart';

import '../utils/colors_util.dart';
import '../widgets/package_wiget.dart';

class KhamPhaSrceen extends StatelessWidget {
  static const routeName = '/khampha';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Khám phá',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Icon(
            Icons.search_outlined,
            size: 30,
          ),
        ],
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
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            PackageWiget(),
          ],
        ),
      ),
    );
  }
}
