import 'package:flutter/cupertino.dart';
import 'dart:math';

class UpperLeftDesign extends StatelessWidget {
  final double diameter;

  const UpperLeftDesign({Key key, this.diameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UpperLeftDesignPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0x63C1FF);
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            width: size.width,
            height: size.height),
        pi,
        pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
