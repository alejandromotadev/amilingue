//COLORS
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const primaryBackground = Color(0xffFFFFFF);
const secondaryBackground = Color(0xff906CF3);
const primaryTextColor = Color(0xff4E4E4E);
const blackTextColor= Color(0xff4A4A4A);
const buttonColor = Color(0xffFFF6FF);
const checkColor = Color(0xffA8FFBB);


const darkmodebutton = Color(0xff906cf3);
const darkmodeTextColor = Color(0xffFFFFFF);
const darkmodeprimarycolor = Color(0xff000000);
const darkmodeSecondarycolor = Color(0xffFFFFFF);


class ButtonConstant extends StatelessWidget {
  //
  ButtonConstant({
    required this.widthSize,
    required this.heightSize,
    required this.backgroundColor,
    required this.text,
    required this.color
}
  );

  final double widthSize;
  final double heightSize;
  final Color backgroundColor;
  final String text;
  final Color color;


  Widget build(BuildContext context) {
    return Container(
      width: widthSize,
      height: heightSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 4))
          ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w800, color: color),
        ),
      ),
    );
  }
}
