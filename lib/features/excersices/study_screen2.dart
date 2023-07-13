import 'dart:math';

import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: camel_case_types
class Study_Screen2 extends StatefulWidget {
  
  const Study_Screen2({super.key});

  @override
  State<Study_Screen2> createState() => _Study_Screen2State();
}

class _Study_Screen2State extends State<Study_Screen2> {
  List<Map<String, String>> listaSimulada = [
    {
      'id': '1',
      'texto': 'Usecase',
    },
    {
      'id': '2',
      'texto': 'Code',
    },
    {
      'id': '3',
      'texto': 'Error',
    },
    // Agrega más elementos según sea necesario
  ];
  List<Map<String, String>> listaSimulada2 = [
    {
      'id': '1',
      'texto': 'Usecase',
    },
    {
      'id': '2',
      'texto': 'Code',
    },
    {
      'id': '3',
      'texto': 'Error',
    },
    // Agrega más elementos según sea necesario
  ];
  // this method sort the item.
  void sorting() {
    setState(() {
      listaSimulada.sort();
      listaSimulada2.sort();
    });
  }

  // This method set the new index to the element.
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = listaSimulada.removeAt(oldindex);
      final items1 = listaSimulada2.removeAt(oldindex);
      listaSimulada2.insert(newindex, items1);
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
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    "Complete the sentences",
                    style: TextStyle(
                        color: secondaryBackground,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 210, 

                          child: ListView.builder(
                             physics: NeverScrollableScrollPhysics(),
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
                                  elevation: 4,
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
                           
                          ),
                        ),
                        Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 130),
                          child: SvgPicture.asset(
                            'assets/circle.svg',
                            width: 40.0,
                            height: 40.0,
                            color: primaryBackground,
                          ),
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
                          width: 170,
                          height: 210, 

                          child: ReorderableListView.builder(
                             physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: listaSimulada2.length,
                            itemBuilder: (context, index) {
                              final items = listaSimulada2[index];
                              return Card(
                                  key: ValueKey(items['id']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 4,
                                  child: ListTile(
                                    key: ValueKey(items['id']),
                                    title: Text(
                                      items['texto'].toString(),
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
                                final item = listaSimulada2.removeAt(oldIndex);
                                listaSimulada2.insert(newIndex, item);
                              });
                            },
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 190),
                    child: Container(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 115, 225,
                                  119)), // Set the background color to green
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7), // Adjust the corner radius as desired
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Check",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ))
              ],
            )),
          ),
        ));
  }
}
