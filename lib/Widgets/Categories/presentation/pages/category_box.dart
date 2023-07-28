import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String category = "Category test";

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key, required this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, bool>(
      builder: (context, state) {
        return Column(
          children: [
            Container(

              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: state ? darkmodebutton : buttonColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3))
                  ]),
              child: data["icon"]
            ),
            const SizedBox(height: 5),
            Text(
              data["name"],
              maxLines: 1,
              overflow: TextOverflow.fade,
              style:  TextStyle(fontWeight: FontWeight.w500, color: state ? darkmodeTextColor : primaryTextColor ),
            )
          ],
        );
      }
    );
  }
}
