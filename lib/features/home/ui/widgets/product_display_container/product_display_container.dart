// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/core/constants/color_constants.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';

class ProductDisplayContainer extends StatefulWidget {
  const ProductDisplayContainer(
      {super.key, required this.productDataModel, required this.homeBloc});
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  @override
  State<ProductDisplayContainer> createState() =>
      _ProductDisplayContainerState();
}

class _ProductDisplayContainerState extends State<ProductDisplayContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: ColorConstants.primaryWhite,
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
                  onPressed: () => {
                    widget.homeBloc.add(HomeProductWishListButtonClickedEvent(
                        clickedProduct: widget.productDataModel))
                  },
                  color: ColorConstants.primaryGrey.withOpacity(.9),
                  icon: Icon(Icons.favorite_border_outlined),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.productDataModel.imageUrl))),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productDataModel.name,
                    style: TextStyle(
                        color: ColorConstants.primaryGrey.withOpacity(.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(widget.productDataModel.category,
                      style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.primaryGrey.withOpacity(.9),
                              fontSize: 15))),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productDataModel.price.toString(),
                        style: TextStyle(
                            color: ColorConstants.primaryGrey.withOpacity(.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () => {
                          widget.homeBloc.add(HomeProductCartButtonClickedEvent(
                              clickedProduct: widget.productDataModel))
                        },
                        color: ColorConstants.primaryGrey.withOpacity(.9),
                        icon: Icon(Icons.shopping_bag_outlined),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
