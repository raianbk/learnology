// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecure;

  const MyTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obsecure});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black26),
              fillColor: Colors.blue[100],
              filled: true),
        ));
  }
}
