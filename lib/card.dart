import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project2/method.dart';
import 'package:http/http.dart' as http;

class DetailCard extends StatefulWidget {
  const DetailCard({super.key});

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  //

  List<Welcome> welcome = [];

  Future<List<Welcome>> getData() async {
    // http.Response response;
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
    return Scaffold(
      body: Center(
        child: Container(
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
                style: TextStyle(color: Colors.white, fontSize: 18),
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
                  backgroundColor: Colors.white, // background (button) color
                  foregroundColor: Color(0xffff602e),
                  elevation: 0, // foreground (text) color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 18,
                  ),
                ),
                onPressed: () {
                  show();
                },
                child: Text('Invite'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }

  show() {
    FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AlertDialog(
            title: Text('gdhad'),
            content: Row(
              children: [
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
