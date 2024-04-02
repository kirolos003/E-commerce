import 'package:e_commerce/features/categories_screen/presentation/cubit/catalogViewModelStates.dart';
import 'package:e_commerce/features/categories_screen/presentation/pages/catalog_screen.dart';
import 'package:e_commerce/features/home_screen/domain/use_cases/getProductsUseCase.dart';
import 'package:e_commerce/shared/shared_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatalogScreenViewModel extends Cubit<CatalogScreenStates> {
  GetProductsUseCase productsUseCase;

  @factoryMethod
  CatalogScreenViewModel(this.productsUseCase) : super(CatalogScreenInitial()){
    loadCatalogProducts();
  }

  void loadCatalogProducts() async{
    emit(CatalogScreenLoading());
    try {
      var catalogProducts = await productsUseCase.invoke();
      emit(CatalogScreenSuccess(catalogProducts!));
    } catch (e) {
      emit(CatalogScreenError(e.toString()));
    }
  }

  void onCategoryClicked(BuildContext context , String? categoryId , String? categoryName){
    navigateTo(context, CatalogScreen(categoryId: categoryId,categoryName: categoryName,));
  }


}