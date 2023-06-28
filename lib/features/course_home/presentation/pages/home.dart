import 'package:amilingue/Widgets/Categories/presentation/pages/category_box.dart';
import 'package:amilingue/features/authentication/data/models/auth_models.dart';
import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:amilingue/features/course_details/presentation/pages/course_details.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final String nameUser = "Name User";

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserEntity userEntity = UserModel(email: "email", password: "password", name: "name", user_name: "user_name");

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
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      elevation: 0,
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userEntity.user_name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Welcome!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCategories(),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Check these courses",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.white),
            ),
          ),
          getCourses(),
        ],
      ),
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
    return CarouselSlider(
        options: CarouselOptions(
            height: 250, enlargeCenterPage: true, disableCenter: true),
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
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            index["title"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 190,
                        left: 10,
                        child: Row(
                          children: [
                            const Icon((Icons.play_circle_outline)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              index["lessons"],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              index["description"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
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
}
