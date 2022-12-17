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
        backgroundColor: const Color.fromRGBO(208, 208, 219, 1),
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
                        margin: const EdgeInsets.only(top: 5),
                        width: 25,
                        height: 16,
                        child: Image.asset(
                          'assets/images/bar-chart.png',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 25,
                        height: 16,
                        child: Image.asset(
                          'assets/images/bell.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 100, left: 10),
                      child: Text(
                        DateFormat.MMMEd().format(currentDate),
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 5),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: const Color(0xffff5f2d),
                            ),
                          ),
                          child: const Icon(
                            Icons.percent,
                            color: Color(0xffff5f2d),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          padding: const EdgeInsets.only(top: 18, left: 15),
                          height: 420,
                          width: 260,
                          decoration: BoxDecoration(
                            color: const Color(0xffff5f2d),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
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
                              const Text(
                                'Description',
                                style: TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'This Offer applies only on ICICI Debit Cards payment made on Amazon',
                                style: TextStyle(color: Colors.white),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xffff602e),
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
                                child: const Text('Invite'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0x33ecf0f3),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text(
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
          color: const Color.fromRGBO(208, 208, 219, 1),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffff602e),
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
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
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
            title: const Text('gdhad'),
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
                child: const Text('Ok'),
              ),
            ],
          );
        }
        return const ScaffoldMessenger(
          child: SnackBar(
            content: Text('No Data Found!'),
          ),
        );
      },
    );
  }
}
