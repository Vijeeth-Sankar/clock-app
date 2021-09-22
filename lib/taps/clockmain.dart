import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time/taps/time.dart';

class ClockMain extends StatefulWidget {
  const ClockMain({Key? key}) : super(key: key);

  @override
  _ClockMainState createState() => _ClockMainState();
}

class _ClockMainState extends State<ClockMain> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    var formattedTime = DateFormat("HH:mm:ss").format(today);
    var formattedDate = DateFormat('EEE, d MMM').format(today);
    var timezonestring = today.timeZoneOffset.toString().split('.').first;
    var offsetSing = '';
    if (!timezonestring.startsWith('-')) offsetSing = "+";
    print(timezonestring);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              formattedTime,
              style: TextStyle(color: Colors.black, fontSize: 54),
            ),
            Text(
              formattedDate,
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Times(),
            SizedBox(height: 16),
            Text(
              'TimeZone',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Icon(Icons.language, color: Colors.black),
                SizedBox(width: 16),
                Text(
                  'UTC' + offsetSing + timezonestring,
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
