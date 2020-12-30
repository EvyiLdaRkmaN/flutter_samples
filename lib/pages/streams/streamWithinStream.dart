import 'dart:async';

const List<String> list = ['data1', 'data2', 'data3'];

class Streams {
  //Stream within stream
  Stream<String> connection() async* {
    for (var item in list) {
      await Future.delayed(Duration(seconds: 3));
      print(item);
      yield item;
    }
  }

  Stream<String> resolve(Stream<String> stream) async* {
    await Future.delayed(Duration(seconds: 3));
    await for (var item in stream) {
      print('segundo Stream->$item');
    }
    yield 'Completo';
  }

  bool isSend = false;

  final _data = StreamController<String>();
  final _send = StreamController<bool>();

  Stream<bool> get strSend => _send.stream;
  Stream<String> get strData {
    strSend.listen((data) async {
      await Future.delayed(Duration(seconds: 2));
      print('data-->$data, isSend-->$isSend');
      if (isSend)
        _data.add('into');
      else
        _data.add('Exit');
    });

    return _data.stream;
  }

  void sendData() async {
    await Future.delayed(Duration(seconds: 3));
    isSend = !isSend;

    print('send data-->$isSend');
    _send.add(isSend);
  }

  dispose() {
    print('Cerrando streams');
    _data.close();
    _send.close();
  }
}
