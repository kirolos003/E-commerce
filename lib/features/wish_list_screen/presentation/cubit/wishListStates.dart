import 'package:e_commerce/features/home_screen/domain/models/Product.dart';

sealed class WishListStates {}

class UnAuthenticated extends WishListStates {}

class WishListInitial extends WishListStates {}

class WishListLoading extends WishListStates {}

class WishListSuccess extends WishListStates {
  final List<Product>? wishList;

  WishListSuccess(this.wishList);
}

class WishListError extends WishListStates {
  final String error;

  WishListError(this.error);
}