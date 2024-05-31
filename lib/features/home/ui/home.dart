// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/core/constants/color_constants.dart';
import 'package:grocery_app/features/cart/ui/cart.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';
import 'package:grocery_app/features/home/ui/tab_view_pages/all_page/all_page.dart';
import 'package:grocery_app/features/home/ui/tab_view_pages/bakery_page/bakery_page.dart';
import 'package:grocery_app/features/home/ui/tab_view_pages/fruits_page/fruits_page.dart';
import 'package:grocery_app/features/home/ui/tab_view_pages/vegitables_page/vegitables_page.dart';
import 'package:grocery_app/features/home/ui/widgets/add_container/add_container.dart';
import 'package:grocery_app/features/home/ui/widgets/custom_tab_controller/custom_tab_controller.dart';

import 'package:grocery_app/features/home/ui/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:grocery_app/features/profile_Page/profile_page.dart';
import 'package:grocery_app/features/wish_list/ui/wish_list.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishList()));
        } else if (state is HomeProductItemWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item WishListed")));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item added to Cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadingSuccesState:
            final succesState = state as HomeLoadingSuccesState;
            return Scaffold(
              backgroundColor: ColorConstants.primaryBlack,
              body: Container(
                padding: EdgeInsets.only(top: 50, left: 40, right: 40),
                child: Column(
                  children: [ 
                    //app bar row

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome",
                                style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                        color: ColorConstants.primaryGrey,
                                        fontSize: 20))),
                            Text("Shebin Shaji",
                                style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                      color: ColorConstants.primaryWhite,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                ))
                          ],
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg")),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    //search bar
                    SearchBarWidget(),
                    SizedBox(
                      height: 32,
                    ),

                    DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            // all tabs
                            Column(
                              children: [
                                TabBar(
                                    indicatorPadding: EdgeInsets.only(top: 20),
                                    dividerColor: ColorConstants.primaryBlack,
                                    tabAlignment: TabAlignment.start,
                                    padding: EdgeInsets.only(bottom: 20),
                                    indicatorColor: ColorConstants.primaryWhite,
                                    isScrollable: true,
                                    tabs: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "All",
                                          style: TextStyle(
                                              color:
                                                  ColorConstants.primaryWhite,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "Fruits",
                                          style: TextStyle(
                                              color:
                                                  ColorConstants.primaryWhite,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "Vegitables",
                                          style: TextStyle(
                                              color:
                                                  ColorConstants.primaryWhite,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "Bakery",
                                          style: TextStyle(
                                              color:
                                                  ColorConstants.primaryWhite,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  width: double.maxFinite,
                                  height: 450,
                                  child: TabBarView(children: [
                                    AllPage(
                                      homeBloc: homeBloc,
                                      productDataModel: succesState.products[0],
                                    ),
                                    FruitsPage(),
                                    VegitablesPage(),
                                    ProfilePage()
                                  ]),
                                )
                              ],
                            ),

                            //all tab views
                          ],
                        )),
                  ],
                ),
              ),
            );
          case HomeLoadingErrorState:
            return Scaffold(
              body: Center(
                child: Text("Something went wrong!"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
