import 'dart:convert';

import 'package:amilingue/Widgets/Navigation/presentation/navigation.dart';
import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_cubit.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
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
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state == AuthenticationState.authenticated) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const NavigationPage()));
        }
      },
      builder: (context, snapshot) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: primaryBackground,
            body: Center(
              child: Column(
                children: [
                  const Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Center(
                      child: Text(
                        "AMILINGUE",
                        style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 38,
                            fontWeight: FontWeight.w500,
                   ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 4,
                    child: Container(
                      color: secondaryBackground,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
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
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              offset: Offset(0, 2),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            )
                                          ]),
                                      child: TextField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: ('email'),
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
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: ('password'),
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
                                          color: Colors.white,
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
                                            backgroundColor: buttonColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {

                                          /* Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (_) => const NavigationPage())); */
                                          if (emailController.text.isNotEmpty ||
                                              passwordController
                                                  .text.isNotEmpty) {
                                            context.read<AuthenticationCubit>().loginCubit(emailController.text, passwordController.text);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                  'Campos vacios',
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
                                          "sign in",
                                          style: TextStyle(color: primaryTextColor),
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
