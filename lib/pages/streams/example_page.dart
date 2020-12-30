import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/streams/streamWithinStream.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  StreamController<double> _controller = StreamController.broadcast();
  double numero = 0.0;
  final _streamExample = Streams();
  @override
  void dispose() {
    print('Ejecutando dispose()');
    _controller.close();
    _streamExample.dispose();
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: _streamExample.strData,
              initialData: 'sin data',
              builder: (_, snapshot) {
                print('In pantalla-->${snapshot.data}');
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return Container(
                  child: Text('Otra subscripción valor: ${snapshot.data}'),
                );
              },
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              StreamBuilder<double>(
                  stream: _controller.stream,
                  initialData: 0.0,
                  builder: (_, snapshot) {
                    return Text('Hola Mundo:${snapshot.data}');
                  }),
              MaterialButton(
                color: Colors.blue,
                child: Text('subscribe again'),
                onPressed: () {
                  _controller.stream.listen((event) {
                    print('hola mundo:$event');
                  });
                },
              ),
              MaterialButton(
                color: Colors.yellow,
                child: Text('Emit value'),
                onPressed: () {
                  _controller.add(numero++);
                },
              ),
              
            ]),
            MaterialButton(
                color: Colors.yellow,
                child: Text('send data'),
                onPressed: _streamExample.sendData,
              ),
          ],
        ),
      ),
    );
  }

  // Stream<double> get streamDouble => _controller.stream;
}
