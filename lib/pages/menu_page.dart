import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter samples'),
      ),
      body: ListView(
        children: [
          MyMenuButton(
            title: 'Example streams',
            actionTap: () => 
              Navigator.pushNamed(context, 'streams'),
          ),
          MyMenuButton(
            title: 'Example routes',
            actionTap: () => 
              Navigator.pushNamed(context, 'page1'),
          ),
          MyMenuButton(
            title: 'Animation button loading',
            actionTap: () => 
              Navigator.pushNamed(context, 'buttonLoading'),
          ),
          MyMenuButton(
            title: 'Example images',
            actionTap: () => 
              Navigator.pushNamed(context, 'imagesRow'),
          ),
          MyMenuButton(
            title: 'Example Card',
            actionTap: () => 
              Navigator.pushNamed(context, 'card'),
          )
        ],
      ),
   );
  }
}



class MyMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback actionTap;

  MyMenuButton({this.title, this.actionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: new Text(title),
        onPressed: actionTap,
      ),
    );
  }
}