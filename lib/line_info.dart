import 'package:flutter/material.dart';
import 'package:week12/passengers.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

class LineInfo extends StatefulWidget {
  @override
  State<LineInfo> createState() => new LineInfoState();
}

class LineInfoState extends State<LineInfo> {
  List<Passengers> passList = [
    Passengers(
        id: 1,
        name: 'Assel',
        phone: '87479832020',
        mail: 'assel@gmail.com',
        price: 3000,
        sit_num: '0 A',
        sit: 'Верхний',
        type: 'Offline'),
    Passengers(
        id: 2,
        name: 'Daryn',
        phone: '87479833040',
        mail: 'daryn@gmail.com',
        price: 3000,
        sit_num: '0 B',
        sit: 'Верхний',
        type: 'Offline'),
    Passengers(
        id: 3,
        name: 'Togzhan',
        phone: '87478932020',
        mail: 'togzhan@gmail.com',
        price: 4000,
        sit_num: '1',
        sit: 'Нижний',
        type: 'Online'),
    Passengers(
        id: 4,
        name: 'Нет имени',
        price: 3000,
        sit_num: '0 A',
        sit: 'Верхний',
        type: 'no type'),
    Passengers(
        id: 5,
        name: 'Нет имени',
        price: 3000,
        sit_num: '0 B',
        sit: 'Верхний',
        type: 'no type'),
    Passengers(
        id: 6,
        name: 'Нет имени',
        price: 3000,
        sit_num: '1',
        sit: 'Нижний',
        type: 'no type'),
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
  void _deleteSit(Passengers passenger) {
    Navigator.pop(context);
    setState(() {
      passenger.name = 'Нет имени';
      passenger.type = 'no type';
      passenger.phone = '';
      passenger.mail = '';
      Navigator.of(context).pop();
      _showToast(context);
    });
  }
  void _showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Билет удален",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
  }
  void _onButtonPressed(Passengers passenger) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
              height: 500,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'Информация о пассажире',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 350,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      initialValue: passenger.name,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration.collapsed(hintText: 'Имя'),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      initialValue: passenger.phone,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration.collapsed(hintText: 'Номер'),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      initialValue: passenger.mail,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration.collapsed(hintText: 'Почта'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Mесто',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            width: 120,
                            height: 70,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              enabled: false,
                              initialValue:
                                  passenger.sit_num + ' ' + passenger.sit,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black26),
                              decoration:
                                  InputDecoration.collapsed(hintText: 'Место'),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Цена',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            width: 120,
                            height: 70,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              initialValue: passenger.price.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              decoration:
                                  InputDecoration.collapsed(hintText: 'Цена'),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 10, left: 10),
                        decoration: new BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: FlatButton(
                            onPressed: null,
                            child: Text(
                              'Изменить',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 10, left: 10),
                        decoration: new BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: FlatButton(
                            onPressed: null,
                            child: Text(
                              'Отправить чек',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 10, left: 10),
                    decoration: new BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FlatButton(
                        onPressed: (){
                          Widget cancelButton = FlatButton(
                              child: Text("НЕТ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              });
                          Widget continueButton = FlatButton(
                              child: Text("ДА",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0)),
                              onPressed: () => _deleteSit(passenger));

                          AlertDialog alert = AlertDialog(
                              content: Text("Вы хотите отменить покупку билета?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 21.0)),
                              actions: [cancelButton, continueButton]);
                          showDialog(context: context, builder: (context) => alert);
                        },
                        child: Text(
                          'Отменить покупку билета',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ],
              ));
        });
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
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  for (Passengers item in getBought(passList))
                    Container(
                      child: new InkWell(
                        onTap: () => _onButtonPressed(item),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(fontSize: 20),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    item.sit_num,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(item.sit)
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, right: 20, left: 20),
                                decoration: new BoxDecoration(
                                  color: getColor(item.type),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item.type,
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              'Свободные места',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  for (Passengers item in getFree(passList))
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                item.sit_num,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(item.sit)
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            decoration: new BoxDecoration(
                              color: getColor(item.type),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              item.type,
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )
                ],
              )),
        ],
      ),
    );
  }
}
