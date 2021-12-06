import 'package:flutter/material.dart';
import 'package:grow_app/constants/colors.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {
  double currentProgress;
  CircleProgress(this.currentProgress);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..strokeWidth = 12
      ..color = orange
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 80;
    // canvas.drawCircle(center, radius, paint);
    //draw animation with paint
    Paint paintAnimationArcDone = Paint()
      ..strokeWidth = 15
      ..color = orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Paint paintAnimationArcTodo = Paint()
      ..strokeWidth = 15
      ..color = yallow
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Paint paintAnimationArcPending = Paint()
      ..strokeWidth = 15
      ..color = blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, paintAnimationArcDone);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -(pi / 2),
        angle, false, paintAnimationArcTodo);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi, angle,
        false, paintAnimationArcPending);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
