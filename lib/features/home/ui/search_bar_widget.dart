// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/color_constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
          color: ColorConstants.primaryGrey.withOpacity(.2),
          borderRadius: BorderRadius.all(Radius.circular(23))),
      child: Padding(
        padding: EdgeInsets.only(left: 25, bottom: 6),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: ColorConstants.primaryGrey,
              size: 26,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: TextField(
              style:
                  TextStyle(color: ColorConstants.primaryWhite, fontSize: 17),
              decoration: InputDecoration(
                  hintText: "Search Grocery",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(color: ColorConstants.primaryGrey)),
            ))
          ],
        ),
      ),
    );
  }
}
