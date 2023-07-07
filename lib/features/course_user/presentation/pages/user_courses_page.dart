import 'package:amilingue/features/course_details/presentation/pages/course_details.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, bool>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: state ? darkmodeprimarycolor : primaryBackground,
              appBar: buildAppBar(),
              body: buildBody()),
        );
      }
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      elevation: 0,
      title:  BlocBuilder<AppThemeCubit, bool>(
        builder: (context, state) {
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Currently studying",
                    style: TextStyle(
                        color: state ? darkmodeTextColor : secondaryBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
           ),
                  ),
                ],
              )
            ],
          );
        }
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: BlocBuilder<AppThemeCubit, bool>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userCurrentCourses(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Text(
                  "Featured",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: state ? darkmodeTextColor : secondaryBackground,
                      shadows: const [
                        Shadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              getCourses(),
            ],
          );
        }
      ),
    );
  }

  Widget userCurrentCourses() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: BlocBuilder<AppThemeCubit, bool>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: state ? darkmodebutton : primaryBackground,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 3))
                        ]),
                    child: Icon(
                      Icons.computer,
                      size: sizeIcon,
                      color: state ? darkmodeTextColor : secondaryBackground,
                    )),
                 Text(
                  "Software development",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: state ? darkmodeTextColor : primaryTextColor,
                  ),
                ),
                 Icon(Icons.navigate_next,
                    color: state ? darkmodeTextColor : secondaryBackground, size: 30)
              ]),
            ],
          );
        }
      ),
    );
  }

  Widget getCourses() {
    return BlocBuilder<AppThemeCubit, bool>(
      builder: (context, state) {
        return CarouselSlider(
            options: CarouselOptions(
                height: 190, enlargeCenterPage: true, disableCenter: true),
            items: courses.map((index) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CourseView()));
                    },
                    child: Container(
                      width: 280,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 5, top: 5),
                      decoration: BoxDecoration(
                          color: state ? darkmodebutton : buttonColor,
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
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 150,
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: state ? darkmodebutton : buttonColor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(1, 4))
                                  ]),
                              child: Center(
                                child: Text(
                                  index["title"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(
                                      color: state ? darkmodeTextColor : primaryTextColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 130,
                            left: 10,
                            child: Row(
                              children: [
                                 Icon((Icons.play_circle_outline), color: state ? darkmodeTextColor : secondaryBackground,),
                                const SizedBox(width: 5),
                                Text(
                                  index["lessons"],
                                  style:  TextStyle(
                                      color:  state ? darkmodeTextColor : secondaryBackground,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  index["description"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(color: state ? darkmodeTextColor : primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList());
      }
    );
  }
}
