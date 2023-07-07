import 'dart:convert';

import 'package:amilingue/features/authentication/presentation/authentication_page.dart';
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
    return BlocBuilder<AppThemeCubit,bool>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state ? darkmodeprimarycolor : primaryBackground,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: const CircleAvatar(
                        radius: 50,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(user == null ? 'placeholder name' : user["name"], style: TextStyle(color: state ? darkmodeTextColor : primaryTextColor ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email, color: secondaryBackground,),
                        const SizedBox(width: 10),
                        Text(email == null ? 'placeholderemail@dev.com' : user["email"], style: TextStyle(color: secondaryBackground ),),
                      ],
                    ),

                  ],
                ),
                BlocBuilder<SettingsSwitchCubit, bool>(
                    builder: (context,state){
                      return Switch(value: state, onChanged: (val){
                        context.read<SettingsSwitchCubit>().changeDarkMode(val);
                        context.read<AppThemeCubit>().updateTheme(val);
                      });
                    }),
                BlocListener<SettingsLogoutCubit, void>(
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        ),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<SettingsLogoutCubit>().logout();
                        //TODO: REMOVER LA SIGUIENTE LINEA EN IMPLEMENTACION
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthenticationView(),
                          ),
                        );
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
                    //pushToPage(context, "/login");

                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
