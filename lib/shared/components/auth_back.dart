
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.7694175,0);
    path_0.cubicTo(size.width*0.3444806,0,0,size.height*0.5015053,0,size.height*1.120141);
    path_0.cubicTo(0,size.height*1.738777,size.width*0.3103398,size.height*1.978583,size.width*0.7694175,size.height*1.641527);
    path_0.cubicTo(size.width*1.228495,size.height*1.304470,size.width*1.538835,size.height*1.738777,size.width*1.538835,size.height*1.120141);
    path_0.cubicTo(size.width*1.538835,size.height*0.5015053,size.width*1.194354,0,size.width*0.7694175,0);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.5000000,0), Offset(size.width*0.5000000,size.height*0.01000000), [Color(0xff074ba0).withOpacity(1),Color(0xff042650).withOpacity(1)], [0,1]);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}