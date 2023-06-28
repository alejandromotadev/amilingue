import 'package:amilingue/Widgets/Navigation/cubit/navigation_cubit.dart';
import 'package:amilingue/features/course_home/presentation/pages/home.dart';
import 'package:amilingue/features/profile/presentation/page/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //TODO: AGREGAR MAS VISTAS
    final screens = [
      const HomeView(),
      const ProfileView()
    ];

    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: Colors.white70,
            enableFeedback: true,
            currentIndex: context.read<NavigationCubit>().state,
            onTap: (index) {
              context.read<NavigationCubit>().changePage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey,),
                label: "home",
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.grey,),
                label: "profile",
                activeIcon: Icon(Icons.person),
              )
            ],
          );
        },
      ),
      body: SafeArea(
        child: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return IndexedStack(
              index: context.read<NavigationCubit>().state,
              children: screens,
            );
          },
        ),
      ),
    );
  }
}