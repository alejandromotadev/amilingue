import 'package:flutter/material.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffAE70EC),
      appBar: AppBar(
        title: Text("Curso"),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text("Excercise"),
                      InkWell(
                        onTap: () {
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
                  const SizedBox(width: 30,),
                  Column(
                    children: [
                      const Text("Lessons"),
                      InkWell(
                        onTap: () {
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
                  const SizedBox(width: 30,),
                  Column(
                    children: [
                      const Text("Videos"),
                      InkWell(
                        onTap: () {
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
                  const SizedBox(width: 30,),
                  Column(
                    children: [
                      const Text("Test"),
                      InkWell(
                        onTap: () {
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
                  const SizedBox(width: 30,),
                  Column(
                    children: [
                      const Text("Request meeting"),
                      InkWell(
                        onTap: () {
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
