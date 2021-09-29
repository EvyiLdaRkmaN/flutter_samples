import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/InheritedWidget/Colors_bloc.dart';
import 'package:flutter_samples/pages/InheritedWidget/MyInheritedWidget.dart';
import 'package:flutter_samples/pages/InheritedWidget/second_page.dart';

class MyInheritedWidgetPage extends StatelessWidget {
  final myColor = ColorBloc(myColor: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      colorBloc: myColor,
      child: StreamBuilder<Color>(
          stream: myColor.colorStream,
          builder: (context, snapshot) {
            return MaterialApp(
              home: FirstPage(),
            );
          }),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = MyInheritedWidget.of(context).colorBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('MyInheritedWidget'),
        backgroundColor: color.myColor,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Color nuevo',
                style: TextStyle(
                    color: MyInheritedWidget.of(context).colorBloc.myColor)),
            RaisedButton(
                child: Text('Set color red'),
                onPressed: () {
                  MyInheritedWidget.of(context).colorBloc.changeColor(Colors.red);
                }),
            RaisedButton(
                child: Text('navigate to second page'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SecondPage()));
                }),
          ],
        ),
      ),
    );
  }
}
