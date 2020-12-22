import 'package:flutter/material.dart';


class PageOnePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Page 1'),
            Text('navigate to Page 2 with pushNamed'),
            RaisedButton(
              child: Text('Navigate'),
              onPressed: ()=>Navigator.pushNamed(context, 'page2'),
            )
          ],
        ),
     ),
   );
  }
}