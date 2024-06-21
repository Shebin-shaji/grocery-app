part of 'wish_list_bloc.dart';

@immutable
sealed class WishListState {}

abstract class WishListActionState extends WishListState {}

final class WishListInitial extends WishListState {}

class WishListSuccesState extends WishListState {
  final List<ProductDataModel> wishListItems;

  WishListSuccesState({required this.wishListItems});
}
