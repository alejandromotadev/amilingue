import 'dart:math';
import 'package:amilingue/features/excersices/presentation/cubit/exercise_cubit.dart';
import 'package:amilingue/features/excersices/presentation/pages/study_screen1.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: camel_case_types
class Study_Screen2 extends StatefulWidget {
  const Study_Screen2({super.key});

  @override
  State<Study_Screen2> createState() => _Study_Screen2State();
}

class _Study_Screen2State extends State<Study_Screen2> {
  int stateIndex = 0;
  double statePercent = 0.0;

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


  void chooseId() {
    Future.delayed(Duration(seconds: 1));
    final exercises = context.read<ExerciseCubit>().exerciseList;
    var sentences = exercises[stateIndex]["sentences"];
    separateList(sentences);
  }

  void separateList(List sentences) {
    sentenceDesorder=[];
    sentence=[];
    answer=[];
    for (int i = 0; i < sentences.length; i++) {
      sentence.add({'id': i + 1, 'texto': sentences[i][0]});
      answer.add({'id': i + 1, 'texto': sentences[i][1]});
    }
    sentenceDesorder = List.from(sentence);
    sentenceDesorder.shuffle(Random());
  }

  _openBottomModalSheet() {
    return ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Good job',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight:
              FontWeight.w500,
              fontSize: 18),
        ),
      ),
    );
  }

  _openBottomModalSheetError() {
    return ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Oops, try again',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight:
              FontWeight.w500,
              fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseCubit, ExerciseState>(builder: (context, state) {
         if (state is Loaded) {
    return Scaffold(
        backgroundColor: primaryBackground,
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
              onPressed: () async{
                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                await sharedPreferences.remove("id_course");
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
                percent: statePercent,
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
                  Expanded(
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
                            child:
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                 child: Text(
                                  item['texto'].toString(),
                                  textAlign: TextAlign.center,
                              ),
                               ),

                            );
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
                  Expanded(
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
                            child:
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                child: Text(
                                  items['texto'].toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                            );
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
                      if(statePercent >=0.9){
                        print("exito");
                        Navigator.pop(context);
                      }
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
                      setState(() {
                        stateIndex++;
                        statePercent += 0.1;
                      });
                      chooseId();

                    } else {
                      _openBottomModalSheetError();
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
       return const Center(
         child: CircularProgressIndicator(),
       );
        }
      });
  }
}
