import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/InheritedWidget/MyInheritedWidget.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = MyInheritedWidget.of(context).colorBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
        backgroundColor: color.myColor,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hola Mundo', style: TextStyle(color: color.myColor),),
            RaisedButton(
                child: Text('Change color to amber'),
                onPressed: () => color.changeColor(Colors.amber))
          ],
        ),
      ),
    );
  }
}
