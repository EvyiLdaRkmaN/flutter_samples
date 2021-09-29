import 'dart:async';
import 'package:flutter/material.dart';

class ColorBloc {
  Color myColor;
  ColorBloc({this.myColor = Colors.amber});
  
  final _color = StreamController<Color>();

  Stream<Color> get colorStream => _color.stream;
  
  void changeColor(Color newColor) {
    _color.add(newColor);
    myColor = newColor;
  }
}