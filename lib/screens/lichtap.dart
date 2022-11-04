import 'package:dotted_border/dotted_border.dart';
import 'package:gym_fit/providers/functionuser.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/excersice_sets.dart';
import '../providers/funcitonBuoiTap.dart';
import '../providers/user.dart';
import '../utils/colors_util.dart';
import '../widgets/exercise_set_widget.dart';
import '../widgets/lichtap_widget.dart';
import '../widgets/package_wiget.dart';

class LichTapSrceen extends StatefulWidget {
  static const rounteName = '/lichtap';
  @override
  State<LichTapSrceen> createState() => _LichTapSrceenState();
}

class _LichTapSrceenState extends State<LichTapSrceen> {
  bool _select = false;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  RangeSelectionMode _range = RangeSelectionMode.toggledOff;
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   final userId = ModalRoute.of(context)!.settings.arguments as int;
  //   if (userId != null) {
  //     final postModel =
  //         Provider.of<BuoiTaps>(context, listen: false).findbyName(userId);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đăng ký buổi tập',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
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
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            LichTapWidget(),
          ],
        ),
        // child: Column(children: <Widget>[
        //   SizedBox(
        //     height: 30,
        //   ),
        //   ElevatedButton(
        //     onPressed: () {},
        //     child: Icon(Icons.schedule_outlined, color: Colors.white),
        //     style: ElevatedButton.styleFrom(
        //       shape: CircleBorder(),
        //       padding: EdgeInsets.all(20),
        //       backgroundColor: Colors.yellow, // <-- Button color
        //       foregroundColor: Colors.white, // <-- Splash color
        //     ),
        //   ),
        //   SizedBox(
        //     height: 40,
        //   ),
        //   Container(
        //     width: 500,
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //           Colors.black,
        //           hexStringToColor('41413f'),
        //           hexStringToColor('777777'),
        //         ],
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //       ),
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     child: DottedBorder(
        //       strokeWidth: 1,
        //       color: Colors.yellow,
        //       borderType: BorderType.RRect,
        //       radius: Radius.circular(20),
        //       dashPattern: [20, 10],
        //       child: Padding(
        //         padding: const EdgeInsets.only(bottom: 5),
        //         child: TableCalendar(
        //           firstDay: DateTime.now(),
        //           headerStyle: HeaderStyle(
        //             formatButtonVisible: false,
        //             leftChevronVisible: false,
        //             rightChevronVisible: false,
        //             formatButtonShowsNext: false,
        //             titleCentered: true,
        //             titleTextStyle: TextStyle(
        //               color: Colors.yellow,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           lastDay: DateTime.now(),
        //           focusedDay: _focusedDay,
        //           rangeSelectionMode: _range,
        //           calendarFormat: _calendarFormat,
        //           calendarStyle: CalendarStyle(
        //             selectedTextStyle: TextStyle(
        //               color: Colors.yellow,
        //             ),
        //             selectedDecoration: BoxDecoration(
        //                 color: Colors.blueGrey, shape: BoxShape.circle),
        //           ),
        //           calendarBuilders: CalendarBuilders(
        //             dowBuilder: (context, day) {
        //               final text = DateFormat.E().format(day);

        //               return Center(
        //                 child: Text(
        //                   text,
        //                   style: TextStyle(color: Colors.yellow),
        //                 ),
        //               );
        //             },
        //           ),
        //           selectedDayPredicate: (day) {
        //             // Use `selectedDayPredicate` to determine which day is currently selected.
        //             // If this returns true, then `day` will be marked as selected.

        //             // Using `isSameDay` is recommended to disregard
        //             // the time-part of compared DateTime objects.
        //             return isSameDay(_selectedDay, day);
        //           },
        //           onDaySelected: (selectedDay, focusedDay) {
        //             if (!isSameDay(_selectedDay, selectedDay)) {
        //               // Call `setState()` when updating the selected day
        //               setState(() {
        //                 _selectedDay = selectedDay;
        //                 _focusedDay = focusedDay;
        //               });
        //             }
        //           },
        //           onFormatChanged: (format) {
        //             if (_calendarFormat != format) {
        //               // Call `setState()` when updating calendar format
        //               _calendarFormat = CalendarFormat.week;
        //             }
        //           },
        //           onPageChanged: (focusedDay) {
        //             // No need to call `setState()` here
        //             _focusedDay = focusedDay;
        //           },
        //         ),
        //       ),
        //     ),
        //   ),
        //   // ),
      ),
    );
  }
}
