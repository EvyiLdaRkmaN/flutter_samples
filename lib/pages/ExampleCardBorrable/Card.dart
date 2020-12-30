import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final List<int> days = [1, 2, 3, 4, 5, 6, 7];
  final List<String> docs = ['uno', 'dos', 'tres'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card')),
      body: Center(
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 3,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Números de la semana'),
                  ],
                ),
                title: Container(
                  height: MediaQuery.of(context).size.height / 16,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text('${days[index]}',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54)),
                                      ],
                                    ),
                                    SizedBox(width: 28.0),
                                  ],
                                ),
                              ]),
                        );
                      }),
                ),
                subtitle: Container(
                    height: MediaQuery.of(context).size.height / 20,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text('${docs[index]}',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54)),
                                        Text('data')
                                        // Aqui es donde estoy tratando de encontrar el valor en mi QuerySnashot y colocarlo en el Widget que le asigne la fecha correspondiente**
                                      ],
                                    ),
                                    SizedBox(width: 28.0),
                                  ],
                                ),
                              ]);
                        })),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "148",
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
