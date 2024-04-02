

import 'package:e_commerce/features/home_screen/domain/models/Product.dart';

sealed class CatalogScreenStates {}

class CatalogScreenInitial extends CatalogScreenStates {}

class CatalogScreenLoading extends CatalogScreenStates {}

class CatalogScreenSuccess extends CatalogScreenStates {
  final List<Product> catalogProductsList;

  CatalogScreenSuccess(this.catalogProductsList);
}

class CatalogScreenError extends CatalogScreenStates {
  final String error;

  CatalogScreenError(this.error);
}

