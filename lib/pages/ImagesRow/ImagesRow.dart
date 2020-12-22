import 'package:flutter/material.dart';

class ImagesRow extends StatelessWidget {
  final images = [
    {'image':'assets/img/1.png', 'title':'image 1'},
    {'image':'assets/img/2.png', 'title':'image 2'},
    {'image':'assets/img/3.png', 'title':'image 3'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (_,i)=>Row(
          children: [
            Image.asset(
              images[i]['image'],
              width: 200,),
            Text(images[i]['title'])
          ],
        ),
      ),
    );
  }
}