import 'dart:async';

import 'package:flutter/material.dart';


class StreamPage extends StatefulWidget {

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  StreamController<double> _controller = StreamController.broadcast();
  double numero = 0.0;

  @override
  void dispose() { 
    print('Ejecutando dispose()');
    _controller.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisSize:MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _controller.stream ,
              initialData: 0.0 ,
              builder: (_, snapshot){
                return Container(
                  child: Text('Otra subscripción valor: ${snapshot.data}'),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                StreamBuilder<double>(
                  stream: _controller.stream,
                  initialData: 0.0,
                  builder: (_, snapshot) {
                    return Text('Hola Mundo:${snapshot.data}');
                  }
                ),
                MaterialButton(
                  color: Colors.blue,
                  child: Text('subscribe again'),
                  onPressed: (){
                    _controller.stream.listen((event) {print('hola mundo:$event');});
                  },
                ),

                MaterialButton(
                  color: Colors.yellow,
                  child: Text('Emit value'),
                  onPressed: (){
                    _controller.add(numero++);
                  },
                ),
              ]
     ),
          ],
        ),
      ),
   );
  }

  // Stream<double> get streamDouble => _controller.stream;
}