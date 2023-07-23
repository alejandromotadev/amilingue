import 'dart:convert';
import 'package:amilingue/Widgets/Categories/presentation/pages/category_box.dart';
import 'package:amilingue/features/course_details/presentation/pages/course_details.dart';
import 'package:amilingue/features/course_details/presentation/pages/cubit/course_cubit.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  dynamic user;

  @override
  void initState() {
    // TODO: implement initState
    setUserData();
    super.initState();
  }

  setUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      user = jsonDecode(sharedPreferences.getString('user')!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, bool>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: state ? darkmodeprimarycolor : primaryBackground,
              appBar: buildAppBar(),
              body: buildBody()),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      elevation: 0,
      title: BlocBuilder<AppThemeCubit, bool>(builder: (context, state) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user["name"] ?? "placeholder Name",
                  style: const TextStyle(
                    color: secondaryBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    color: state ? darkmodeTextColor : primaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: BlocBuilder<AppThemeCubit, bool>(builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCategories(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Text(
                "Check these courses",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: state ? darkmodeSecondarycolor : secondaryBackground,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            getCourses(),
          ],
        );
      }),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CategoryBox(
              data: categories[index],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCourses() {
    return BlocBuilder<CourseCubit, CourseState>(builder: (context, state) {
      final courseController = context.read<CourseCubit>();

      return BlocBuilder<AppThemeCubit, bool>(builder: (context, state) {
        return CarouselSlider(
            options: CarouselOptions(
                height: 190, enlargeCenterPage: true, disableCenter: true),
            //courseController.courseList.map
            items: courseController.courseList.map((index) {
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
                                  style: TextStyle(
                                      color: state
                                          ? darkmodeTextColor
                                          : primaryTextColor,
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
                                Icon((Icons.play_circle_outline),
                                    color: state
                                        ? darkmodeSecondarycolor
                                        : secondaryBackground),
                                const SizedBox(width: 5),
                                Text(
                                  //index["lesson_cant"]
                                  "lessons",
                                  style: TextStyle(
                                      color: state
                                          ? darkmodeSecondarycolor
                                          : secondaryBackground,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  index["description"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: state
                                          ? darkmodeSecondarycolor
                                          : primaryTextColor),
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
      });
    });
  }
}
