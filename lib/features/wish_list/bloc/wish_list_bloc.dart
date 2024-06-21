import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_items.dart';
import 'package:grocery_app/data/wishlist_items.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveFromWishListEvent>(wishListRemoveFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListSuccesState(wishListItems: wishlistItems));
  }

  FutureOr<void> wishListRemoveFromWishListEvent(
      WishListRemoveFromWishListEvent event, Emitter<WishListState> emit) {
    wishlistItems.remove(event.productDataModel);
  }
}
