import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Times extends StatefulWidget {
  const Times({Key? key}) : super(key: key);

  @override
  _TimesState createState() => _TimesState();
}

class _TimesState extends State<Times> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: clockpainter(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class clockpainter extends CustomPainter {
  var dateTime = DateTime.now();

  // 60 sec 360 degree  1 sec 6 degree

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.width / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xff444974);

    var outlineBrush = Paint()
      ..color = Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerfillBrush = Paint()..color = Color(0xffeaecff);

    var sechandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    var minhandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xff748ef6), Color(0xff77ddff)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var hourhandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xffEa74ab), Color(0xffc279fb)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), sechandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minhandBrush);

    var hourHandX = centerX + 60 * cos(dateTime.hour * 30 * pi / 180);
    var hourHandY = centerX + 60 * sin(dateTime.hour * 30 * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourhandBrush);

    canvas.drawCircle(center, 16, centerfillBrush);

    // ignore: unused_local_variable
    var outCircleBrush = radius;
    // ignore: unused_local_variable
    var innerCircleBrush = radius - 14;
    // var dashBrush = Paint()..color = Colors.black;

    // for (double i = 0; i < 360; i += 12) {
    //   var x1 = centerX + outCircleBrush * cos(i * pi / 180);
    //   var y1 = centerY + outCircleBrush * sin(i * pi / 180);

    //   var x2 = centerY + innerCircleBrush * cos(i * pi / 180);
    //   var y2 = centerY + innerCircleBrush * sin(i * pi / 180);
    //   canvas.drawLine(
    //     Offset(x1, y1),
    //     Offset(x2, y2),
    //     dashBrush,
    //   );
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // ignore: todo
    // TODO: implement shouldRepaint
    return true;
  }
}
