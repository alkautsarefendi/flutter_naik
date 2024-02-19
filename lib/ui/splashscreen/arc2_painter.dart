import 'dart:math';
import 'dart:ui' as UI;
import 'dart:math' as math;

import 'package:flutter/material.dart';

class Arc2Painter extends CustomPainter {

  Arc2Painter({
    required this.color,
    this.iconsSize = 3,
    required this.image,
    required this.imageColor});

  final Color color;
  final double iconsSize;
  final List<UI.Image> image;
  final Color imageColor;

  @override
  Future<void> paint(Canvas canvas, Size size) async{
    final Paint p = Paint()
        ..color = color
        ..strokeWidth = 1.0
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

    final ColorFilter filter = ColorFilter.mode(imageColor, BlendMode.srcATop);

    num degressToRoads(num deg) {
      return deg * (pi / 180.0);
    }

    //drawing ring arcs with imagesIcons
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final Offset center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final noOfImages = image.length;
    final arcAngel = 360 / noOfImages;

    for (var i = 0; i < noOfImages; i++) {
      final radians = degressToRoads(i * arcAngel.toDouble());
      final Offset pointOnArc = Offset(
        radius * math.cos(radians) + center.dx,
        radius * math.sin(radians) + center.dy
      );

      canvas.drawImage(
          image[i],
          pointOnArc + Offset(-(image[i].width / 2).toDouble(), -(image[i].height / 2).toDouble()),
          Paint()..colorFilter = filter
      );


      canvas.drawArc(
          rect,
          degressToRoads((i * arcAngel) + image[i].width / 2).toDouble(),
          degressToRoads(arcAngel - image[i].width).toDouble(),  //sweepAngle
          false,
          p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}