import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import '../../domain/models/Brand.dart';
import '../../domain/models/Category.dart';

sealed class HomeScreenStates {}

class HomeScreenInitial extends HomeScreenStates {}

class HomeScreenLoading extends HomeScreenStates {}

class HomeScreenSuccess extends HomeScreenStates {
  final List<Category>? categoriesList;
  final List<Brand>? brandsList;
  final List<Product>? productsList;

  HomeScreenSuccess(this.categoriesList ,this.brandsList, this.productsList);
}

class HomeScreenError extends HomeScreenStates {
  final String error;

  HomeScreenError(this.error);
}
