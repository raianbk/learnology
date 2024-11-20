// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String btnText;
  final Color color;
  final double padValue;
  const MyButton({
    super.key,
    required this.onTap,
    required this.btnText,
    required this.color,
    required this.padValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padValue),
        // margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
