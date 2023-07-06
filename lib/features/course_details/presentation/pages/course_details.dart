import 'package:amilingue/Widgets/Categories/presentation/pages/category_box.dart';
import 'package:amilingue/features/lessons/presentation/pages/lesson_course.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
          backgroundColor: primaryBackground,
          appBar: buildAppBar(),
          body: buildBody()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,

    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: buttonColor,
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
                  style: const TextStyle(
                      color: secondaryBackground,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              courses[4]["description"],
              style: const TextStyle(
                color: primaryTextColor,
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
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: const Text(
                "Study",
                style: TextStyle(color: primaryTextColor, fontSize: 20),
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
                    const Text(
                      "CATEGORIES",
                      style: TextStyle(
                          color: primaryTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      categories[1]["name"],
                      style: const TextStyle(color: primaryTextColor, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text("RELATED COURSES",
                        style: TextStyle(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                    Text(
                      courses[1]["title"],
                      style: const TextStyle(color: primaryTextColor, fontWeight: FontWeight.w500),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Text("Lesson 1",
                          style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 30,
                      child: Text("Lesson 1",
                          style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 30,
                      child: Text("Lesson 1",
                          style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 30,
                      child: Text("Lesson 1",
                          style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
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
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Text(
                  "Request meeting",
                  style: TextStyle(color: primaryTextColor, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
