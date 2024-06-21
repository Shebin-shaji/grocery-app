part of 'wish_list_bloc.dart';

@immutable
sealed class WishListEvent {}

class WishListInitialEvent extends WishListEvent {}

class WishListRemoveFromWishListEvent extends WishListEvent {
  final ProductDataModel productDataModel;

  WishListRemoveFromWishListEvent({required this.productDataModel});
}
