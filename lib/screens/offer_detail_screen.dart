import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/method/api_method.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //

  DateTime currentDate = DateTime.now();

  List<Welcome> welcome = [];

  Future<List<Welcome>> getData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/3'));
    var data = jsonDecode(response.body.toString());

    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        welcome.add(Welcome.fromJson(index));
      }
      return welcome;
    } else {
      return welcome;
    }
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
                SizedBox(height: 150),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 100, left: 10),
                      child: Text(
                        DateFormat.MMMEd().format(currentDate),
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 5),
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
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.only(top: 18, left: 15),
                          height: 420,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Color(0xffff5f2d),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '20% offer dfgjhdf',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  Text(
                                    'Amazon',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                'Description',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'This Offer applies only on ICICI Debit Cards payment made on Amazon',
                                style: TextStyle(color: Colors.white),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xffff602e),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 35,
                                    vertical: 18,
                                  ),
                                ),
                                onPressed: () {
                                  // showInvite();
                                },
                                child: Text('Invite'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0x33ecf0f3),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      'Reminder on',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
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
                  onPressed: () {},
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

  showInvite() {
    FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AlertDialog(
            title: Text('gdhad'),
            content: Row(
              children: const [
                Icon(Icons.person),
                Text(''),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        }
        return ScaffoldMessenger(
          child: SnackBar(
            content: Text('No Data Found!'),
          ),
        );
      },
    );
  }
}
