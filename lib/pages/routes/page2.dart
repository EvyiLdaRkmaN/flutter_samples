import 'package:flutter/material.dart';


class PageTwoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Page 2'),
            Text('navigate to Page 3 with pushReplacementName'),
            RaisedButton(
              child: Text('Navigate'),
              onPressed: ()=>Navigator.pushReplacementNamed(context, 'page3'),
            )
          ],
        ),
     ),
   );
  }
}