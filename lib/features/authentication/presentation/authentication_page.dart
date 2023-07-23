import 'dart:convert';

import 'package:amilingue/Widgets/Navigation/presentation/navigation.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_cubit.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
import 'package:amilingue/features/course_details/presentation/pages/cubit/course_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  setUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user = jsonDecode(sharedPreferences.getString('user')!);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  dynamic user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(builder: (context, state) {
      return BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state == AuthenticationState.authenticated) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const NavigationPage()));
          } else if(state == AuthenticationState.none){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Check your credentials',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            );
          }
        },
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: secondaryBackground,
              body: Center(
                child: Column(
                  children: [
                     Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Image.asset("assets/ic_launcher_foreground.png"),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 3,
                      child: Container(
                        height: double.maxFinite,
                        width: 380,
                        decoration: const BoxDecoration(
                          color: primaryBackground,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                        ),

                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints viewportConstraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: viewportConstraints.maxHeight,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.2),
                                              offset: Offset(0, 2),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            )
                                          ]),
                                      child: TextField(

                                        controller: emailController,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: ('EMAIL'),
                                            prefixIcon: Icon(Icons.email,
                                                color: secondaryBackground)),
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.2),
                                              offset: Offset(0, 2),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            )
                                          ]),
                                      child: TextField(
                                        controller: passwordController,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: ('PASSWORD'),
                                            prefixIcon: Icon(Icons.lock,
                                                color: secondaryBackground)),
                                        textInputAction: TextInputAction.done,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      width: 300,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.2),
                                              spreadRadius: 1,
                                              offset: Offset(0, 4),
                                              blurRadius: 1,
                                            )
                                          ]),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: secondaryBackground,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10))),
                                        onPressed: () {
                                          if (emailController
                                                  .text.isNotEmpty ||
                                              passwordController
                                                  .text.isNotEmpty) {
                                            context
                                                .read<AuthenticationCubit>()
                                                .loginCubit(
                                                    emailController.text,
                                                    passwordController.text);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                  'FILL FIELDS',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text(
                                          "SIGN IN",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
