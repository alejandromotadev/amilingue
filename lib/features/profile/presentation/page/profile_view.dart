import 'package:amilingue/features/authentication/presentation/authentication_page.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = "user";
    final image = "";
    return Scaffold(
      backgroundColor: const Color(0xffAE70EC),
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
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: const CircleAvatar(
                    radius: 100,
                  ),
                ),
                const SizedBox(height: 10),
                Text(user ?? ""),
                Text("curso")
              ],
            ),
            BlocListener<SettingsLogoutCubit, void>(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      )
                    ]),
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
