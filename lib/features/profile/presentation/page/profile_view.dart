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
    return Scaffold(
      backgroundColor: primaryBackground,
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
                    radius: 100,
                  ),
                ),
                const SizedBox(height: 10),
                Text(user == null ? 'place' : user["name"]),
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
}
