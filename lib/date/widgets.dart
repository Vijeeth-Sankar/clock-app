// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  bool strated = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timertodisplay = "";
  bool checktimer = true;

  void start() {
    setState(() {
      strated = false;
      stopped = false;
    });
    timeForTimer = ((hours * 60 * 60) + (minutes * 60) + seconds);
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timeForTimer < 1 || checktimer == false) {
          t.cancel();
          checktimer = true;
          timertodisplay = "";
        } else if (timeForTimer < 60) {
          timertodisplay = timeForTimer.toString();
          timeForTimer = timeForTimer - 1;
        } else if (timeForTimer < 3600) {
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);
          timertodisplay = m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timertodisplay = h.toString() +
              ":" +
              m.toString() +
              toString() +
              ":" +
              s.toString();
          timeForTimer = timeForTimer - 1;
        }
      });
    });
  }

  void stop() {
    setState(() {
      strated = true;
      stopped = true;
      checktimer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Hours",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 24,
                      value: hours,
                      onChanged: (value) => setState(() => hours = value),
                    ),
                  ],
                ),

                //minute

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Minute",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 24,
                      value: minutes,
                      onChanged: (value) => setState(() => minutes = value),
                    ),
                  ],
                ),

                //seconds

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Seconds",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 24,
                      value: seconds,
                      onChanged: (value) => setState(() => seconds = value),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              timertodisplay,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: duplicate_ignore
              children: <Widget>[
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: strated ? start : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  color: Colors.green,
                  child: Text("Start"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                RaisedButton(
                  onPressed: stopped ? null : stop,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  color: Colors.red,
                  child: Text("Stop"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
