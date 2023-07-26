import 'dart:math';

import 'package:amilingue/features/course_details/data/models/course_model.dart';
import 'package:amilingue/features/course_details/domain/entity/course.dart';
import 'package:amilingue/features/course_details/presentation/pages/course_details_screen.dart';
import 'package:amilingue/features/excersices/presentation/cubit/exercise_cubit.dart';
import 'package:amilingue/features/excersices/presentation/pages/study_screen1.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  bool _isBottomModalOpen = false;
  var courseList;

  @override
  void initState() {
    super.initState();
    chooseId(); // Llama a la función deseada aquí
  }

  List<Map<String, dynamic>> sentence =
      []; // Declarar como variable de instancia
  List<Map<String, dynamic>> answer = []; // Declarar como variable de instancia
  List<Map<String, dynamic>> sentenceDesorder =
      []; // Declarar como variable de instancia

  // this method sort the item.
  void sorting() {
    setState(() {
      sentence.sort();
      answer.sort();
    });
  }

  void chooseId() {
    final exercises = context.read<ExerciseCubit>().exerciseList;
    var randomItem = (exercises..shuffle()).first;
    var sentences = randomItem["sentences"];
    print(sentences);
    separateList(sentences);
  }

  void separateList(List sentences) {
    for (int i = 0; i < sentences.length; i++) {
      sentence.add({'id': i + 1, 'texto': sentences[i][0]});
      answer.add({'id': i + 1, 'texto': sentences[i][1]});
    }
    print(sentence);
    sentenceDesorder = List.from(sentence);
    sentenceDesorder.shuffle(Random());
  }

  _openBottomModalSheet() {
    setState(() {
      _isBottomModalOpen = true;
    });
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 80,
            decoration: BoxDecoration(color: primaryBackground.withOpacity(.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Study_Screen1()),
                          );
                        },
                        child: const Text(
                          "WELL DOOOONE DUDE",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryTextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).whenComplete(() {
      // Este código se ejecutará cuando el modal se cierre
      setState(() {
        _isBottomModalOpen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Detectar el toque en cualquier lugar fuera del BottomModalSheet
      onTap: () {
        // Si _isBottomModalOpen es true, navegar a otra pantalla
        if (_isBottomModalOpen) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Study_Screen1()),
          );
        }
      },
      child:
          BlocBuilder<ExerciseCubit, ExerciseState>(builder: (context, state) {
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                            itemCount: sentenceDesorder.length,
                            itemBuilder: (context, index) {
                              final item = sentenceDesorder[index];
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
                            itemCount: answer.length,
                            itemBuilder: (context, index) {
                              final items = answer[index];
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
                                final item = answer.removeAt(oldIndex);
                                answer.insert(newIndex, item);
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
                          bool checkIdsAreSame() {
                            if (sentenceDesorder.length != answer.length) {
                              return false; // Las listas no tienen la misma cantidad de elementos, por lo tanto, no son iguales
                            }

                            for (int i = 0; i < sentenceDesorder.length; i++) {
                              if (sentenceDesorder[i]['id'] !=
                                  answer[i]['id']) {
                                return false; // Las IDs no son iguales en la misma posición
                              }
                            }

                            return true; // Todos los IDs son iguales
                          }

                          if (checkIdsAreSame()) {
                            _openBottomModalSheet();
                          } else {
                            print(sentenceDesorder);
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
      }),
    );
  }
}
