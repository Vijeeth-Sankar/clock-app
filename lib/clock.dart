import 'package:flutter/material.dart';
import 'package:time/date/Alarm.dart';
import 'package:time/taps/clockmain.dart';

class Clockwidget extends StatefulWidget {
  const Clockwidget({Key? key}) : super(key: key);

  @override
  _ClockwidgetState createState() => _ClockwidgetState();
}

class _ClockwidgetState extends State<Clockwidget> {
  int _currentIndex = 0;

  final tabs = [
    ClockMain(),
    Alarms(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clock"), backgroundColor: Color(0xff444974)),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later),
              title: Text('Clock'),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              title: Text('Timer'),
              backgroundColor: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
