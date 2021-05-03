import 'package:flutter/material.dart';
import 'package:week12/passengers.dart';

class LineInfo extends StatelessWidget {
  List<Passengers> passList = [
    Passengers(name: 'Assel', sit_num: '0 A', sit: 'Верхний', type: 'Offline'),
    Passengers(name: 'Daryn', sit_num: '0 B', sit: 'Верхний', type: 'Offline'),
    Passengers(name: 'Togzhan', sit_num: '1', sit: 'Нижний', type: 'Online'),
    Passengers(
        name: 'Нет имени', sit_num: '0 A', sit: 'Верхний', type: 'no type'),
    Passengers(
        name: 'Нет имени', sit_num: '0 B', sit: 'Верхний', type: 'no type'),
    Passengers(name: 'Нет имени', sit_num: '1', sit: 'Нижний', type: 'no type'),
    Passengers(
        name: 'Нет имени', sit_num: '2', sit: 'Верхний', type: 'no type'),
    Passengers(name: 'Нет имени', sit_num: '2', sit: 'Нижний', type: 'no type'),
  ];

  Color getColor(String type) {
    if (type == "Offline") {
      return Colors.grey;
    } else {
      return Colors.green;
    }
  }

  List getBought(List passengers) {
    List<Passengers> boughtPass = [];
    for (var i = 0; i < passengers.length; i++) {
      if (passengers[i].type != 'no type') {
        boughtPass.add(passengers[i]);
      }
    }
    return boughtPass;
  }

  List getFree(List passengers) {
    List<Passengers> freePass = [];
    for (var i = 0; i < passengers.length; i++) {
      if (passengers[i].type == 'no type') {
        freePass.add(passengers[i]);
      }
    }
    return freePass;
  }

  Widget cardTemplate(passengers) {
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: new InkWell(
            onTap: () {},
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      passengers.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          passengers.sit_num,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(passengers.sit)
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 20, left: 20),
                      decoration: new BoxDecoration(
                        color: getColor(passengers.type),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        passengers.type,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Пассажиры'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 20)),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Имя',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Место',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Тип',
                    style: TextStyle(fontSize: 25),
                  )
                ]),
            Flexible(
                flex: 1,
                child: Container(
                  height: 250,
                  child: ListView(
                    children: getBought(passList)
                        .map((passengers) => cardTemplate(passengers))
                        .toList(),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Свободные места',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Flexible(
                flex: 1,
                child: Container(
                  height: 250,
                  child: ListView(
                    children: getFree(passList)
                        .map((passengers) => cardTemplate(passengers))
                        .toList(),
                  ),
                )),
          ],
        ));
  }
}
