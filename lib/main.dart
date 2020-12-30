import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/AnimationButton/ButtonLoading.dart';
import 'package:flutter_samples/pages/ExampleCardBorrable/Card.dart';
import 'package:flutter_samples/pages/ImagesRow/ImagesRow.dart';
import 'package:flutter_samples/pages/menu_page.dart';
import 'package:flutter_samples/pages/routes/page1.dart';
import 'package:flutter_samples/pages/routes/page2.dart';
import 'package:flutter_samples/pages/routes/page3.dart';
import 'package:flutter_samples/pages/streams/example_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/'       : (context)=> MenuPage(),
        'streams' : (context)=> StreamPage(),
        'page1' : (context)=> PageOnePage(),
        'page2' : (context)=> PageTwoPage(),
        'page3' : (context)=> PageThreePage(),
        'buttonLoading' : (context)=> ButtonLoadingPage(),
        'imagesRow' : (context)=> ImagesRow(),
        'card' : (context)=> CardPage(),
      },
    );
  }
}
