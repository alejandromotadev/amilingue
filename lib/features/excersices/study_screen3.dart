import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: camel_case_types
class Study_Screen3 extends StatefulWidget {
  const Study_Screen3({super.key});
  @override
  State<Study_Screen3> createState() => _Study_Screen3State();
}

final player = AudioPlayer();
bool isPlaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;
String formatTime(int seconds) {
  return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
}

class _Study_Screen3State extends State<Study_Screen3> {
  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Material(
              child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    "Fill in the gaps",
                    style: TextStyle(
                        color: secondaryBackground,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100, left: 60),
                  child: Row(
                    children: [
                      isPlaying
                          ? IconButton(
                              onPressed: () {
                                player.pause();
                              },
                              icon: SvgPicture.asset(
                                'assets/playButton.svg',
                                width: 70.0,
                                height: 70.0,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                player.play(
                                    UrlSource('https://example.com/audio.mp3'));
                              },
                              icon: SvgPicture.asset(
                                'assets/playButton.svg',
                                width: 70.0,
                                height: 70.0,
                              ),
                            ),
                      Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) {
                          final position = Duration(seconds: value.toInt());
                          player.seek(position);
                          player.resume();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("What kind of"),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: 600,
                    height: 70,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(
                                        0.5)), // Agrega la opacidad deseada al color
                                hintText: 'type what your heard',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("is that"),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Container(
                      width: 320,
                      height: 60,
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
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ))
              ],
            ),
          )),
        ));
  }
}
