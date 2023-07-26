import 'dart:math';

import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: camel_case_types
class Study_Screen1 extends StatefulWidget {
  const Study_Screen1({super.key});

  @override
  State<Study_Screen1> createState() => _Study_Screen1State();
}

class _Study_Screen1State extends State<Study_Screen1> {
  List<Map<String, String>> listaSimulada = [
    {
      'id': '1',
      'texto': 'Usecase',
      'url': 'https://ejemplo.com/imagen1.jpg',
    },
    {
      'id': '2',
      'texto': 'Code',
      'url': 'https://ejemplo.com/imagen2.jpg',
    },
    {
      'id': '3',
      'texto': 'Error',
      'url': 'https://ejemplo.com/imagen3.jpg',
    },
    // Agrega más elementos según sea necesario
  ];
  // this method sort the item.
  void sorting() {
    setState(() {
      listaSimulada.sort();
    });
  }

  // This method set the new index to the element.
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = listaSimulada.removeAt(oldindex);
      listaSimulada.insert(newindex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listaDesordenada = List.from(listaSimulada);
    listaDesordenada.shuffle(Random());

    return Scaffold(
        backgroundColor: primaryBackground,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: secondaryBackground,
                size: 36,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearPercentIndicator(
                width: 290.0,
                lineHeight: 10.0,
                percent: 0.5,
                backgroundColor: secondaryBackground,
                progressColor: checkColor,
                barRadius: Radius.circular(60.00),
              ),
            ],
          ),
        ),
        body: Material(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Match the pairs",
                style: TextStyle(
                    color: secondaryBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/playButton.svg',
                      width: 80.0,
                      height: 80.0,
                    ),
                    SvgPicture.asset(
                      'assets/playButton.svg',
                      width: 80.0,
                      height: 80.0,
                    ),
                    SvgPicture.asset(
                      'assets/playButton.svg',
                      width: 80.0,
                      height: 80.0,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/circle.svg',
                      width: 40.0,
                      height: 40.0,
                      color: buttonColor,
                    ),
                    SvgPicture.asset(
                      'assets/circle.svg',
                      width: 20.0,
                      height: 20.0,
                      color: primaryBackground,
                    ),
                    SvgPicture.asset(
                      'assets/circle.svg',
                      width: 20.0,
                      height: 20.0,
                      color: primaryBackground,
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  child: ReorderableListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listaSimulada.length,
                    itemBuilder: (context, index) {
                      final item = listaSimulada[index];
                      return Card(
                          key: ValueKey(item['id']),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: buttonColor,
                          elevation: 2,
                          child: ListTile(
                            key: ValueKey(item['id']),
                            title: Text(
                              item['texto'].toString(),
                              textAlign: TextAlign.center,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 16),
                          ));
                    },
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final item = listaSimulada.removeAt(oldIndex);
                        listaSimulada.insert(newIndex, item);
                      });
                    },
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: ButtonConstant(
                    widthSize: 320,
                    heightSize: 60,
                    backgroundColor: checkColor,
                    text: "Check",
                    color: blackTextColor),
              )
            ],
          )),
        ));
  }
}
