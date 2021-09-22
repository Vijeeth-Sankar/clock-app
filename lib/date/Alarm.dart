import 'dart:async';

import 'package:flutter/material.dart';

class Alarms extends StatefulWidget {
  const Alarms({Key? key}) : super(key: key);

  @override
  _AlarmsState createState() => _AlarmsState();
}

class _AlarmsState extends State<Alarms> {
  int counter = 10;
  late Timer _timer;

  void startTimer() {
    counter = 10;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (counter > 0)
                ? Text("")
                : Text(
                    "Done!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            Text(
              '$counter',
              style: TextStyle(fontSize: 28),
            ),
            RaisedButton(
              onPressed: () => startTimer(),
              child: Text("Start count", style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }
}
