import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintPlayground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomPaint(
                size: Size(200, 250),
                painter: TrianglePainter(),
              ),
              CustomPaint(
                size: Size(100, 00),
                painter: CubePainter(),
              ),
              CustomPaint(
                size: Size(400, 400),
                painter: CirclePainter(),
              ),
              CustomPaint(
                size: Size(200, 10),
                painter: SquarePainter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Offset center = Offset(width / 2, height / 2);

    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(center.dx - 100, center.dy)
      ..lineTo(center.dx + 100, center.dy)
      ..lineTo(center.dx, center.dy - 120)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CubePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Offset center = Offset(width / 2, height / 2);

    Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    Rect outerRect = Rect.fromCenter(
      center: center,
      height: 100,
      width: 100,
    );
    Rect innerRect = Rect.fromCenter(
      center: Offset(width / 2 + 50, height / 2 + 50),
      height: 100,
      width: 100,
    );

    //Inner Rect
    canvas.drawRect(outerRect, paint);

    //Outer Rect
    canvas.drawRect(innerRect, paint);

    canvas.drawLine(
      Offset(width / 2 + 50, height / 2 + 50),
      Offset(width / 2 + 100, height / 2 + 100),
      paint,
    );

    canvas.drawLine(
      Offset(width / 2 - 50, height / 2 + 50),
      Offset(width / 2, height / 2 + 100),
      paint,
    );
    canvas.drawLine(
      Offset(width / 2 - 50, height / 2 - 50),
      Offset(width / 2, height / 2),
      paint,
    );
    canvas.drawLine(
      Offset(width / 2 + 50, height / 2 - 50),
      Offset(width / 2 + 100, height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Offset center = Offset(width / 2, height / 2);

    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, 70, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Offset center = Offset(width / 2, height / 2);

    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(center.dx - 50, center.dy)
      ..lineTo(center.dx + 50, center.dy)
      ..lineTo(center.dx + 50, center.dy - 50)
      ..lineTo(center.dx - 50, center.dy - 50)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
