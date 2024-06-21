import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_items.dart';
import 'package:grocery_app/data/grocery_list.dart';
import 'package:grocery_app/data/wishlist_items.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonNavigateEvent>(
        homeProductWishListButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(
      HomeLoadingSuccesState(
        products: AllGroceryData.groceryProducts
            .map((e) => ProductDataModel(
                  description: e['description'],
                  id: e['id'],
                  name: e['name'],
                  price: e['price'],
                  imageUrl: e['imageUrl'],
                  category: e['category'],
                ))
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductWishListButtonNavigateEvent(
      HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("wish list navigate clicked");
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("cart navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
