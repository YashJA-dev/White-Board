import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteBoardProvider extends ChangeNotifier {
  late Color _selectedColor = Colors.black;
  double _strokeWidth = 5;
  double get strokeWidth => this._strokeWidth;

  set strokeWidth(double value){
    this._strokeWidth = value;
    notifyListeners();
    
  } 
  Color get selectedColor => this._selectedColor;

  set selectedColor(Color value) {
    this._selectedColor = value;
    notifyListeners();
  }
}
