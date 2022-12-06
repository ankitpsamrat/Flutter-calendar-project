import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/method/add_event_method.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //

  late Map<DateTime, List<Event>> selectedEvents;

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  final _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

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
                    ],
                  ),
                ),
                Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime(2015),
                      lastDay: DateTime(2030),
                      focusedDay: focusedDay,
                      headerStyle: HeaderStyle(
                        headerMargin: EdgeInsets.only(left: 40, right: 40),
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      onDaySelected: (selectDay, focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        });
                      },
                      selectedDayPredicate: (date) {
                        return isSameDay(selectedDay, date);
                      },
                      eventLoader: _getEventsfromDay,
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Color(0xffff5f2d),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        todayDecoration: BoxDecoration(
                          color: Color(0xff3e8bff),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ..._getEventsfromDay(selectedDay).map(
                      (Event event) => ListTile(
                        title: Text(
                          DateFormat.MMMEd().format(selectedDay),
                          style: TextStyle(fontSize: 25),
                        ),
                        subtitle: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xffff5f2d),
                                ),
                              ),
                              child: Icon(
                                Icons.percent,
                                color: Color(0xffff5f2d),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 10),
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 15,
                                bottom: 15,
                              ),
                              width: 260,
                              decoration: BoxDecoration(
                                color: Color(0xffff5f2d),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                child: Text(
                                  event.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, 'details');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
                    backgroundColor: Color(0xffff602e),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 13,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    addEvents();
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

  addEvents() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Event'),
        content: TextFormField(
          controller: _eventController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancle'),
          ),
          TextButton(
            onPressed: () {
              if (_eventController.text.isEmpty) {
              } else {
                if (selectedEvents[selectedDay] != null) {
                  selectedEvents[selectedDay]!.add(
                    Event(title: _eventController.text),
                  );
                } else {
                  selectedEvents[selectedDay] = [
                    Event(title: _eventController.text)
                  ];
                }
              }
              Navigator.pop(context);
              _eventController.clear();
              setState(() {});
              return;
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}
