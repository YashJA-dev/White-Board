import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ProviderWhiteBoard.dart';

class SliderWhiteBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WhiteBoardProvider whiteboardProvider =
        Provider.of<WhiteBoardProvider>(context);
    return Positioned(
        top: 350,
        left: 10,
        child: RotatedBox(
          quarterTurns: -1,
          child: Slider(
            activeColor: Colors.white,
            
            min: 0,
            max: 40,
            value: whiteboardProvider.strokeWidth,
            onChanged: (value) {
              whiteboardProvider.strokeWidth = value;
            },
          ),
        ));
  }
}
