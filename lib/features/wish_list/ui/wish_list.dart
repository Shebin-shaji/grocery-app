// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/wish_list/bloc/wish_list_bloc.dart';
import 'package:grocery_app/features/wish_list/ui/widgets/wish_list_tile_widget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishListBloc wishListBloc = WishListBloc();
  @override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("WishList Items",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: BlocConsumer<WishListBloc, WishListState>(
        bloc: wishListBloc,
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccesState:
              final succesState = state as WishListSuccesState;
              return ListView.builder(
                  itemCount: succesState.wishListItems.length,
                  itemBuilder: (context, index) => WishListTileWidget(
                      productDataModel: succesState.wishListItems[index],
                      wishListBloc: wishListBloc));
          }
          return Container();
        },
      ),
    );
  }
}
