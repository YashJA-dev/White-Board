import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:provider/provider.dart';
import 'package:whiteboard/WhiteBoard/WhiteBoard.dart';

import 'ProviderWhiteBoard.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _selectedColor=Colors.black;
 late WhiteBoardProvider whiteboardProvider;
  @override
  Widget build(BuildContext context) {
     whiteboardProvider=Provider.of<WhiteBoardProvider>(context);
    _selectedColor=whiteboardProvider.selectedColor;
    List<Color> colors=[
      Colors.pink,
      Colors.red,
      Colors.black,
      Colors.yellow,
      Colors.amberAccent,
      Colors.blue,
      Colors.green,
      Colors.indigo,
      Colors.grey,
      Colors.limeAccent,
    ];
    List<Widget> list=List.generate(colors.length, (index) => _buildChosenColor(colors[index]));
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: GradientColors.blue)),
      
      child: Scaffold(       
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomAppBar(
            color: Colors.black,  
            child: Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: list,
                ),
              ),
            ),
          ),
          body: WhiteBoard(),
        ),
    );
  }

  Widget _buildChosenColor(Color color) {
    bool selected=_selectedColor==color;
    return GestureDetector(
      onTap: (){
        whiteboardProvider.selectedColor=color;
      },
      child: Container(
        height: selected?37:30,
        width: selected?37:30,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,

          border: selected?Border.all(
            color: Colors.white,
            width: 3,
          ):null
        ),
      ),
    );
  }
}