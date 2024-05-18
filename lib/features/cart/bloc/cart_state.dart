part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

abstract class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartSuccesState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccesState({required this.cartItems});
}
