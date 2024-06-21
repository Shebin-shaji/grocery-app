// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/core/constants/color_constants.dart';

class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget({super.key, required this.text, required this.size});
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.notoSans(
          textStyle: TextStyle(
              color: ColorConstants.primaryWhite,
              fontSize: size,
              fontWeight: FontWeight.w600),
        ));
  }
}
