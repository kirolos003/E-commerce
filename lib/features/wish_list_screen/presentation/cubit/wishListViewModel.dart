import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/wish_list_screen/domain/use_cases/getFavoritesUseCase.dart';
import 'package:e_commerce/features/wish_list_screen/presentation/cubit/wishListStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishListViewModel extends Cubit<WishListStates> {
  List <Product>? favoritesList = [];
  GetFavoritesUseCase favoritesUseCase;
  WishListViewModel(this.favoritesUseCase) : super(WishListInitial());

  @factoryMethod
  void loadWishList() async{
    emit(WishListLoading());
    try {
      favoritesList = await favoritesUseCase.invoke();
      emit(WishListSuccess(favoritesList));
    } catch (e) {
      emit(WishListError(e.toString()));
    }
  }
}