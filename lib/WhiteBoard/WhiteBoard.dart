import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:provider/provider.dart';
import 'package:whiteboard/ProviderWhiteBoard.dart';

import 'SliderWhiteBoard.dart';

class WhiteBoard extends StatefulWidget {
  @override
  State<WhiteBoard> createState() => _WhiteBoardState();
}

class _WhiteBoardState extends State<WhiteBoard> {
  late WhiteBoardProvider whiteboardProvider;

  late Size size;

  List<DrawingPoint?> pointList = [];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    whiteboardProvider = Provider.of<WhiteBoardProvider>(context);
    return Stack(
      children: [
        GestureDetector(
            onPanStart: (details) {
              setState(() {
                DrawingPoint drawingPoint = DrawingPoint(
                  details.localPosition,
                  Paint()
                    ..color = whiteboardProvider.selectedColor
                    ..isAntiAlias = true
                    ..strokeWidth = whiteboardProvider.strokeWidth
                    ..strokeCap = StrokeCap.round,
                );
                pointList.add(drawingPoint);
              });
            },
            onPanUpdate: (details) {
              setState(() {
                DrawingPoint drawingPoint = DrawingPoint(
                  details.localPosition,
                  Paint()
                    ..color = whiteboardProvider.selectedColor
                    ..isAntiAlias = true
                    ..strokeWidth = whiteboardProvider.strokeWidth
                    ..strokeCap = StrokeCap.round,
                );
                pointList.add(drawingPoint);
              });
            },
            onPanEnd: (_) {
              setState(() {
                pointList.add(null);
              });
            },
            child: CustomPaint(
              
              painter: _DrawingPainter(pointList),
              child: Container(
                height: size.height,
                width: size.width,
                // child: ,
              ),
            ),
        
        ),
        Positioned(
            top: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  pointList = [];
                });
              },
              child: Row(children: [Icon(Icons.close), Text("Clear Screen")]),
            )),
            SliderWhiteBoard()
      ],
    );
  }
}

class _DrawingPainter extends CustomPainter {
  late List<DrawingPoint?> drawingPoint;
  List<Offset> offsetList = [];
  _DrawingPainter(this.drawingPoint);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoint.length - 1; i++) {
      if (drawingPoint[i] != null && drawingPoint[i + 1] != null) {
        canvas.drawLine(drawingPoint[i]!.offset, drawingPoint[i + 1]!.offset,
            drawingPoint[i]!.paint);
      } else if (drawingPoint[i] != null && drawingPoint[i + 1] == null) {
        offsetList.clear();
        offsetList.add(drawingPoint[i]!.offset);
        canvas.drawPoints(PointMode.points, offsetList, drawingPoint[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;
  DrawingPoint(this.offset, this.paint);
}
