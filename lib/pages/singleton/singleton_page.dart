import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/singleton/simple_singleton.dart';

class SingletonPage extends StatefulWidget {
  @override
  _SingletonPageState createState() => _SingletonPageState();
}

class _SingletonPageState extends State<SingletonPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singleton Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Se inicia la instancia de 2 objetos, para realizar la prueba'
                'de singleton, al ser un singleton no importara que existan 2'
                'objectos diferentes del mismo singleton, ambos regresaran los'
                'mismos valores, por que se crea una sola instancia para ambos objetos'),
            RaisedButton(
              child: Text('Inicializar singleton'),
              onPressed: () {
                MySingleton singleton = new MySingleton();
                MySingleton singleton2 = new MySingleton();
                print('value text1 ${singleton.text}');
                print('value text2 ${singleton2.text}');
                number++;
                singleton.text = 'mi nuevo valor $number';
              },
            ),
            Text('Muestra en consola, el valor que contiene singleton'
            'sin importar que salga de la interfaz y se intente crear'
            'nuevamente la instancia del objeto para resetearlo.'),
            RaisedButton(
              child: Text('Valor actual en singleton'),
              onPressed: () {
                MySingleton singleton = new MySingleton();
                print('valor actual en singleton: ${singleton.text}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
