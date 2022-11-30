import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(208, 208, 219, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: 25,
                        height: 16,
                        child: Image.asset(
                          'assets/images/bar-chart.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: 25,
                        height: 16,
                        child: Image.asset(
                          'assets/images/bell.png',
                        ),
                      ),
                      // Icon(Icons.menu),
                      // Icon(Icons.notifications_outlined)
                    ],
                  ),
                ),
                Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime(2015),
                      lastDay: DateTime(2030),
                      focusedDay: DateTime.now(),
                      headerStyle: HeaderStyle(
                        headerMargin: EdgeInsets.only(left: 40, right: 40),
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      weekNumbersVisible: true,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      // daysOfWeekVisible: true,

                      //   //

                      //   onDaySelected: (selectDay, focusDay) {
                      //     setState(() {
                      //       selectedDay = selectDay;
                      //       focusedDay = focusDay;
                      //     });
                      //   },

                      //   selectedDayPredicate: (date) {
                      //     return isSameDay(selectedDay, date);
                      //   },

                      //   eventLoader: _getEventsfromDay,

                      //   calendarStyle: CalendarStyle(
                      //     isTodayHighlighted: true,
                      //     selectedDecoration: BoxDecoration(
                      //       color: Color(0xffff5f2d),
                      //       shape: BoxShape.rectangle,
                      //       borderRadius: BorderRadius.circular(7),
                      //     ),
                      //     // selectedTextStyle: TextStyle(color: Colors.white),
                      //     defaultDecoration: BoxDecoration(
                      //       shape: BoxShape.rectangle,
                      //       borderRadius: BorderRadius.circular(7),
                      //     ),
                      //     todayDecoration: BoxDecoration(
                      //       color: Color(0xff3e8bff),
                      //       shape: BoxShape.rectangle,
                      //       borderRadius: BorderRadius.circular(7),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 15),
                      // ..._getEventsfromDay(selectedDay).map(
                      //   (Event event) => ListTile(
                      //     title: Text(
                      //       DateFormat.MMMEd().format(selectedDay),
                      //       style: TextStyle(fontSize: 25),
                      //       // selectedDay.day.toString(),
                      //     ),
                      //     subtitle: Row(
                      //       // crossAxisAlignment: CrossAxisAlignment.start,
                      //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Container(
                      //           margin: EdgeInsets.only(top: 15),
                      //           padding: EdgeInsets.all(3),
                      //           // backgroundColor: Colors.redAccent,
                      //           decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             border: Border.all(
                      //               width: 2,
                      //               color: Color(0xffff5f2d),
                      //             ),
                      //           ),
                      //           child: Icon(
                      //             Icons.percent,
                      //             color: Color(0xffff5f2d),
                      //           ),
                      //         ),
                      //         // SizedBox(height: 15),
                      //         Container(
                      //           // alignment: Alignment.center,
                      //           margin: EdgeInsets.only(top: 15, left: 10),
                      //           padding: EdgeInsets.only(
                      //               left: 10, top: 15, bottom: 15),
                      //           // height: 50,
                      //           width: 260,
                      //           // color: Color(0xffff5f2d),
                      //           decoration: BoxDecoration(
                      //             color: Color(0xffff5f2d),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: InkWell(
                      //             child: Text(
                      //               event.title,
                      //               // textAlign: TextAlign,
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 15,
                      //               ),
                      //             ),
                      //             onTap: () {
                      //               // Navigator.pushNamed(context, 'details');
                      //               print('taped');
                      //               // detailCard();
                      //             },
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(208, 208, 219, 1),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month_outlined),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xffff602e), // background (button) color
                    foregroundColor: Colors.white,
                    // elevation: 0, // foreground (text) color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 13,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // addEvents();
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
