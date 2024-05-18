// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Text(productDataModel.description),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + productDataModel.price.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, //=> homeBloc.add(
                      //     HomeProductWishListButtonClickedEvent(
                      //         clickedProduct: productDataModel)),
                      icon: Icon(
                        Icons.favorite_border,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  IconButton(
                      onPressed: () => cartBloc.add(CartRemoveFromCartEvent(productDataModel: productDataModel)),
                      icon: Icon(
                        Icons.shopping_bag,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
