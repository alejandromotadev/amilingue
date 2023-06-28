import 'package:amilingue/features/lessons/presentation/pages/lesson_course.dart';
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
          backgroundColor: const Color(0xffAE70EC),
          appBar: buildAppBar(),
          body: buildBody()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      title: Row(
        children: [
          Text(
            courses[0]["title"],
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSlides(),
      ],
    );
  }

  Widget getSlides() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 250.0),
          carouselController: buttonCarouselController,
          items: ["lessons","exercises", "videos", "test", "request meeting"].map((index) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LessonView(),
                        ));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(index, style: TextStyle(fontSize: 16.0),),
                        ],
                      )
                  ),
                );
              },
            );
          }).toList(),
        ),
        ElevatedButton(
          onPressed: () => buttonCarouselController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.linear),
          child: const Icon(Icons.navigate_next)
        )
      ],
    );

  }
}
