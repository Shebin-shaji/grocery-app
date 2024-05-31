// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/color_constants.dart';

class FruitsPage extends StatelessWidget {
  const FruitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 15),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: ColorConstants.primaryGrey.withOpacity(.2),
        ),
      ),
    );
  }
}
