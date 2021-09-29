import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/InheritedWidget/Colors_bloc.dart';
// import 'package:flutter_samples/pages/InheritedWidget/Colors_model.dart';

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({Key key, @required this.child, this.colorBloc}) : super(key: key, child: child);

  final Widget child;
  final ColorBloc colorBloc;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldColor) {
    print('Viendo updateShouldNotify color = ${colorBloc.myColor} oldColor = ${oldColor.colorBloc.myColor}  return ${colorBloc.myColor != oldColor.colorBloc.myColor} ');
    return colorBloc.myColor != oldColor.colorBloc.myColor;
  }
}