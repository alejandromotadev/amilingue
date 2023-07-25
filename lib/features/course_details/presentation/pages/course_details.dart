import 'package:amilingue/features/course_details/presentation/pages/course_details_screen.dart';
import 'package:amilingue/features/course_details/presentation/pages/cubit/course_cubit.dart';
import 'package:amilingue/features/excersices/study_screen1.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:amilingue/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return  BlocBuilder<CourseCubit, CourseState>(
      builder: (context, courseState) {
        final courseController = context.read<CourseCubit>();
        return ListView.separated(
          itemCount: courseController.courseList.length,
          itemBuilder: (context, index) {
            final course = courseController.courseList[index];
            
            return BlocProvider<CourseCubit>.value(
              value: courseController,
              child: CourseViewScreen(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
  });
          
  }
}
