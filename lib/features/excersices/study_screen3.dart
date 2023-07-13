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
              barRadius: const Radius.circular(60.00),
            ),
          ],
        ),
      ),
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Fill in the gaps",
                style: TextStyle(
                    color: secondaryBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              const Text(
                "What kind of",
                style: TextStyle(fontWeight: FontWeight.w600, color: blackTextColor),
              ),
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 4))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      fillColor: Colors.grey,
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(
                              0.5)), // Agrega la opacidad deseada al color
                      hintText: 'type what your heard',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              const Text("is that",
                  style: TextStyle(fontWeight: FontWeight.w800, color: blackTextColor)),
              ButtonConstant(
                  widthSize: 320,
                  heightSize: 60,
                  backgroundColor: checkColor,
                  text: "Check",
                  color: blackTextColor)
            ],
          ),
        ),
      ),
    );
  }
}
