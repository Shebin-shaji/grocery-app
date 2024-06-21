// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.grey, fontSize: 20),
      )),
    );
  }
}
