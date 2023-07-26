import 'dart:math';

import 'package:amilingue/features/course_details/data/models/course_model.dart';
import 'package:amilingue/features/course_details/domain/entity/course.dart';
import 'package:amilingue/features/excersices/presentation/cubit/exercise_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../lessons/data/models/lesson_model.dart';
import '../../../lessons/domain/entity/lessons.dart';

// ignore: camel_case_types
class Study_Screen2 extends StatefulWidget {
  const Study_Screen2({super.key});

  @override
  State<Study_Screen2> createState() => _Study_Screen2State();
}

class _Study_Screen2State extends State<Study_Screen2> {
  var courseList;

  List<Map<String, String>> listaSimulada = [
    {
      'id': '1',
      'texto': 'Compile the code',
    },
    {
      'id': '2',
      'texto': 'Optimize the algorithm',
    },
    {
      'id': '3',
      'texto': 'Debug the software',
    },
    // Agrega más elementos según sea necesario
  ];
  List<Map<String, String>> listaSimulada2 = [
    {
      'id': '1',
      'texto': 'Transform source code to machine code',
    },
    {
      'id': '2',
      'texto': 'Make the program more efficient',
    },
    {
      'id': '3',
      'texto': 'Identify and fix errors in the program',
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

  List<Map<String, dynamic>>? listCourses() {
    if (courseList != null && courseList["data"] != null) {
      return (courseList["data"] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    }
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
  bool checkIdsAreSame() {
  if (listaSimulada.length != listaSimulada2.length) {
    return false; // Las listas no tienen la misma cantidad de elementos, por lo tanto, no son iguales
  }

  for (int i = 0; i < listaSimulada.length; i++) {
    if (listaSimulada[i]['id'] != listaSimulada2[i]['id']) {
      return false; // Las IDs no son iguales en la misma posición
    }
  }

  return true; // Todos los IDs son iguales
}

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listaDesordenada = List.from(listaSimulada);
    listaDesordenada.shuffle(Random());

    return BlocBuilder<ExerciseCubit, ExerciseState>(builder: (context, state) {
      final exerciseController = context.read<ExerciseCubit>();

      if (state is Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is Error) {
        print("error maldita sea");
      }
      if (state is Loaded) {
        return Scaffold(
            backgroundColor: primaryBackground,
            appBar: AppBar(
              forceMaterialTransparency: true,
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              const Text(
                "Complete the sentences",
                style: TextStyle(
                    color: secondaryBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
              Row(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          final item = listaSimulada2
                              .removeAt(oldIndex);
                            listaSimulada2
                              .insert(newIndex, item);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
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
                  onPressed: () {
                      if (checkIdsAreSame()) {
    debugPrint('Correcto');
  } else {
    debugPrint('Incorecto');
  }
                  },
                  child: const Text(
                    "Check",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              )
                ],
              ),
            ));
      } else {
        return Container(
          child: Text(
            "Hola",
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    });
  }
}
