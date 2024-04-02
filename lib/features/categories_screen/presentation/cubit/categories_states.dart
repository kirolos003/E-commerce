

import '../../../home_screen/domain/models/Category.dart';

sealed class CategoriesScreenStates {}

class CategoriesScreenInitial extends CategoriesScreenStates {}

class CategoriesScreenLoading extends CategoriesScreenStates {}

class CategoriesScreenSuccess extends CategoriesScreenStates {
  final List<Category>? categoriesList;

  CategoriesScreenSuccess(this.categoriesList);
}

class CategoriesScreenError extends CategoriesScreenStates {
  final String error;

  CategoriesScreenError(this.error);
}

