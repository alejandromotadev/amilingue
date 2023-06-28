import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Lesson page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        forceMaterialTransparency: true,
      ),
      backgroundColor: primaryBackground,
      body: Center(
        child: getLessons(),
      ),
    );
  }

  Widget getLessons() {
    return CarouselSlider(
        options: CarouselOptions(
            height: 250, enlargeCenterPage: true, disableCenter: true),
        items: lessons.map((index) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 270,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 5, top: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 6))
                    ]),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          index["title_lesson"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 190,
                      left: 10,
                      child: Row(
                        children: [
                          Text(
                            index["description"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList());
  }
}
