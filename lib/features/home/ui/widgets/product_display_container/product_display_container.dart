// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/core/constants/color_constants.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';

class ProductDisplayContainer extends StatelessWidget {
  const ProductDisplayContainer({super.key, required this.productDataModel, required this.homeBloc});
final ProductDataModel productDataModel;
final HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: ColorConstants.primaryGrey.withOpacity(.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  IconButton(
                    onPressed: () => {},
                    color: ColorConstants.primaryWhite,
                    icon: Icon(Icons.favorite_border_outlined),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: Center(child: Image.asset("asset/images/tomato1.png")),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tomato",
                      style: TextStyle(
                          color: ColorConstants.primaryWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text("Vegitables",
                        style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color:
                                    ColorConstants.primaryGrey.withOpacity(.7),
                                fontSize: 15))),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "\$35",
                      style: TextStyle(
                          color: ColorConstants.primaryWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
