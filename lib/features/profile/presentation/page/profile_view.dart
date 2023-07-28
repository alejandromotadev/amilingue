import 'dart:convert';

import 'package:amilingue/features/authentication/presentation/authentication_page.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_cubit.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  dynamic user;
  dynamic email;

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
      email = jsonDecode(sharedPreferences.getString('email')!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, bool>(builder: (context, state) {
      return Scaffold(
        backgroundColor: state ? darkmodeprimarycolor : primaryBackground,
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(color: secondaryBackground),
          ),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of the account",
                            style: TextStyle(
                                color: state
                                    ? darkmodeSecondarycolor
                                    : primaryTextColor),
                          ),
                          Text(
                            user ?? "placeholder name",
                            style: const TextStyle(color: secondaryBackground),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email of the account",
                        style: TextStyle(
                            color: state
                                ? darkmodeSecondarycolor
                                : primaryTextColor),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.email,
                        color: secondaryBackground,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        email ?? "placeholder email",
                        style: const TextStyle(color: secondaryBackground),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Dark mode",
                        style: TextStyle(
                            color: state
                                ? darkmodeSecondarycolor
                                : primaryTextColor),
                      ),
                    ],
                  ),
                  BlocBuilder<SettingsSwitchCubit, bool>(builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        const Icon(Icons.dark_mode_rounded, color: secondaryBackground),
                        Switch(
                            value: state,
                            onChanged: (val) {
                              context
                                  .read<SettingsSwitchCubit>()
                                  .changeDarkMode(val);
                              context.read<AppThemeCubit>().updateTheme(val);
                            }),
                      ],
                    );
                  }),
                ],
              ),

              BlocListener<AuthenticationCubit, AuthenticationState>(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationCubit>().logoutCubit();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Logout",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                listener: (context, state) {
                  if (state == AuthenticationState.none) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthenticationView(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Something happened',
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
              ),
            ],
          ),
        ),
      );
    });
  }
}
