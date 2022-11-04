import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gym_fit/providers/functionthucan.dart';
import 'package:gym_fit/providers/thucan.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/colors_util.dart';
import './tab_bar.dart';
import 'package:intl/intl.dart';
import '../widgets/chart_bar.dart';
import './thongtinthucan.dart';
import '../widgets/user_food.dart';

class DiaryScreen extends StatefulWidget {
  static const routeName = '/diaryscreen';

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  bool _select = false;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  RangeSelectionMode _range = RangeSelectionMode.toggledOff;

  @override
  void initState() {
    super.initState();
    _select = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodToday>(context, listen: false).getAllDataThucAn();
    });
  }

  // Future<void> _refreshProducts(BuildContext context) async {
  //   await Provider.of<FoodToday>(context, listen: false).fetchAndSetProducts();
  // }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<FoodToday>(context);
    print(productsData.itemsThucan.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nhật ký bản thân',
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
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            // child: Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 370,
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: DottedBorder(
                strokeWidth: 1,
                color: Colors.yellow,
                borderType: BorderType.RRect,
                radius: Radius.circular(20),
                dashPattern: [20, 10],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      formatButtonShowsNext: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    lastDay: DateTime.now(),
                    focusedDay: _focusedDay,
                    rangeSelectionMode: _range,
                    calendarFormat: _calendarFormat,
                    calendarStyle: CalendarStyle(
                      selectedTextStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      selectedDecoration: BoxDecoration(
                          color: Colors.blueGrey, shape: BoxShape.circle),
                    ),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        final text = DateFormat.E().format(day);

                        return Center(
                          child: Text(
                            text,
                            style: TextStyle(color: Colors.yellow),
                          ),
                        );
                      },
                    ),
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        _calendarFormat = CalendarFormat.week;
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
              ),
            ),
            // ),

            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 370,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(hexStringToColor('777777')),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.yellow,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 170),
                      child: Text(
                        'Buổi tập kế tiếp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            productsData.itemsThucan == null
                ? Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.yellow,
                                  style: BorderStyle.solid,
                                  width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/coffee-cup.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  hexStringToColor('41413f'),
                                  hexStringToColor('777777'),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: ElevatedButton(
                                child: Image.asset('assets/images/Female.png'),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      ThongTinChiTietThucAnSrceen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Nay mình ăn món này nè',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.yellow[700],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Món ăn hôm nay',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              color: Colors.yellow[700],
                            ),
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    ThongTinChiTietThucAnSrceen.routeName);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100,
                        child: Consumer<FoodToday>(
                          builder: (context, value, child) {
                            // If the loading it true then it will show the circular progressbar
                            if (value.isLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            // If loading is false then this code will show the list of todo item
                            final todos = value.itemsThucan;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: todos.length,
                              itemBuilder: (context, index) {
                                final todo = todos[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.yellow,
                                              style: BorderStyle.solid,
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/coffee-cup.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              hexStringToColor('41413f'),
                                              hexStringToColor('777777'),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                ThongTinChiTietThucAnSrceen
                                                    .routeName,
                                                arguments: todo.id);
                                          },
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: Text(
                                                  todo.name,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  '${todo.soLuong}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.yellow),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
            // : Row(
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.only(left: 20),
            //         child: SizedBox(
            //           width: 100,
            //           height: 100,
            //           child: Container(
            //             child: ConstrainedBox(
            //               constraints: BoxConstraints.expand(),
            //               child: ElevatedButton(
            //                 child: Image.asset('assets/images/Female.png'),
            //                 onPressed: () {
            //                   Navigator.of(context).pushNamed(
            //                       ThongTinChiTietThucAnSrceen.routeName);
            //                 },
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Text(
            //         'Nay mình ăn món này nè',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontFamily: 'OpenSans',
            //           color: Colors.yellow[700],
            //         ),
            //       ),
            //     ],
            //   ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.red,
              thickness: 3,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 30, top: 40),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: ElevatedButton(
                          child: Image.asset('assets/images/Female.png'),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Tham gia các hoạt động \n khác nữa nha',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    color: Colors.yellow[700],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
