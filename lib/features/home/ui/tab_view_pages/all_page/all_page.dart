// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/core/constants/color_constants.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';
import 'package:grocery_app/features/home/ui/widgets/product_display_container/product_display_container.dart';

class AllPage extends StatelessWidget {
  const AllPage(
      {super.key, required this.homeBloc, required this.productDataModel});
  final HomeBloc homeBloc;
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 15),
        itemBuilder: (context, index) => ProductDisplayContainer(
              productDataModel: productDataModel,
              homeBloc: homeBloc,
            ));
  }
}
