import 'package:flutter/material.dart';

const String category = "Category test";

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key, required this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1))
              ]),
          child: data["icon"]
        ),
        Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        )
      ],
    );
  }
}
