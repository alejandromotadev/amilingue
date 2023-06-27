import 'package:amilingue/features/course_details/presentation/pages/course_details.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffAE70EC),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Text("curso ${index + 1}"),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CourseView(),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: const Center(child: Text("hi")),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
