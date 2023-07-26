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
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  dynamic user;
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _loginOrRegisterButton() {
      return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Register instead' : 'Login instead',
            style: const TextStyle(
              color: secondaryBackground,
            )),
      );
    }

    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state == AuthenticationState.authenticated) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const NavigationPage()));
        } else if (state == AuthenticationState.none) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Check your credentials',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
          );
        }
      },
      builder: (context, snapshot) {
        final bloc = context.read<AuthenticationCubit>();

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
                    flex: 5,
                    child: Container(
                      height: double.maxFinite,
                      width: 380,
                      decoration: const BoxDecoration(
                          color: primaryBackground,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40))),
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
                                  if (!isLogin)
                                    Column(
                                      children: [
                                        const SizedBox(height: 20,),
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
                                            controller: nameController,
                                            keyboardType: TextInputType.name,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: ('NAME'),
                                                prefixIcon: Icon(Icons.person,
                                                    color:
                                                        secondaryBackground)),
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
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
                                            controller: usernameController,
                                            keyboardType: TextInputType.name,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: ('USERNAME'),
                                                prefixIcon: Icon(Icons.person,
                                                    color:
                                                    secondaryBackground)),
                                            textInputAction:
                                            TextInputAction.next,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            offset: Offset(0, 2),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          )
                                        ]),
                                    child: TextField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
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
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            offset: Offset(0, 2),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          )
                                        ]),
                                    child: TextField(
                                      controller: passwordController,
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: ('PASSWORD'),
                                          prefixIcon: Icon(Icons.lock,
                                              color: secondaryBackground)),
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
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
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            offset: Offset(0, 4),
                                            blurRadius: 1,
                                          )
                                        ]),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              secondaryBackground,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        if (emailController.text.isNotEmpty ||
                                            passwordController
                                                .text.isNotEmpty) {
                                          isLogin
                                              ? bloc.loginCubit(
                                                  emailController.text,
                                                  passwordController.text)
                                              : bloc.registerCubit(
                                                  nameController.text,
                                                  usernameController.text,
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
                                      child: Text(
                                        isLogin ? "SIGN IN" : "SIGN UP",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _loginOrRegisterButton()
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
  }
}
