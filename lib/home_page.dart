import 'package:flutter/material.dart';
import 'package:project2/add_event_method.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //

  late Map<DateTime, List<Event>> selectedEvents;

  // CalendarFormat calenderFormat = CalendarFormat.month;
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.menu),
                    Icon(Icons.notifications_outlined)
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
                      titleCentered: true,
                      formatButtonVisible: false,
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    // daysOfWeekVisible: true,

                    //

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
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      // selectedTextStyle: TextStyle(color: Colors.white),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  ..._getEventsfromDay(selectedDay).map(
                    (Event event) => ListTile(
                      title: Text(
                        selectedDay.toString(),
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(3),
                        // backgroundColor: Colors.redAccent,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.redAccent),
                        ),
                        child: Icon(Icons.percent, color: Colors.redAccent),
                      ),
                      subtitle: Text(event.title),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(208, 208, 219, 1),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month_outlined),
                ),
                ElevatedButton(
                  onPressed: () {
                    addEvents();
                  },
                  child: Icon(Icons.add),
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
