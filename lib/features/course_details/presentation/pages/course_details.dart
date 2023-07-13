import 'package:amilingue/features/excersices/study_screen1.dart';
import 'package:amilingue/features/excersices/study_screen3.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final String nameUser = "Name User";

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, bool>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: state ? darkmodeprimarycolor : primaryBackground,
            appBar: buildAppBar(),
            body: buildBody()),
      );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: BlocBuilder<AppThemeCubit, bool>(builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: state ? darkmodebutton : buttonColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 3))
                          ]),
                      child: categories[1]["icon"]),
                  const SizedBox(width: 50),
                  Text(
                    courses[0]["title"],
                    style: TextStyle(
                      color: state ? darkmodeTextColor : secondaryBackground,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                courses[4]["description"],
                style: TextStyle(
                  color: state ? darkmodeTextColor : primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                      blurRadius: 1,
                    )
                  ]),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: state ? darkmodebutton : buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const Study_Screen1()));
                },
                child: Text(
                  "Study",
                  style: TextStyle(
                      color: state ? darkmodeTextColor : primaryTextColor,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "CATEGORIES",
                        style: TextStyle(
                            color: state ? darkmodeTextColor : primaryTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(
                        categories[1]["name"],
                        style: TextStyle(
                            color: state ? darkmodeTextColor : primaryTextColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("RELATED COURSES",
                          style: TextStyle(
                              color:
                                  state ? darkmodeTextColor : primaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                      Text(
                        courses[1]["title"],
                        style: TextStyle(
                            color: state ? darkmodeTextColor : primaryTextColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "You'll see",
                    style: TextStyle(
                      color: secondaryBackground,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Text(
                          "Lesson 1",
                          style: TextStyle(
                              color:
                                  state ? darkmodeTextColor : primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 320,
                height: 60,
                decoration: BoxDecoration(
                    color: state ? darkmodebutton : buttonColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                        blurRadius: 1,
                      )
                    ]),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:  state ? darkmodebutton : buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child:  Text(
                    "Request meeting",
                    style: TextStyle(color: state ? darkmodeTextColor : primaryTextColor, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
