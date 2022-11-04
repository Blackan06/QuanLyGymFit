import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final String date;

  ChartBar(this.label, this.date);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Container(
        //   height: 60,
        //   width: 10,
        //   child: Stack(
        //     children: <Widget>[
        //       // Container(
        //       //   decoration: BoxDecoration(
        //       //     border: Border.all(color: Colors.grey, width: 1.0),
        //       //     color: Color.fromRGBO(220, 220, 220, 1),
        //       //     borderRadius: BorderRadius.circular(10),
        //       //   ),
        //       // ),
        //       // FractionallySizedBox(
        //       //   child: Container(
        //       //     decoration: BoxDecoration(
        //       //       color: Theme.of(context).primaryColor,
        //       //       borderRadius: BorderRadius.circular(10),
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
        SizedBox(
          width: 50,
          child: Text(label),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(width: 50, child: Text(date)),
      ],
    );
  }
}
