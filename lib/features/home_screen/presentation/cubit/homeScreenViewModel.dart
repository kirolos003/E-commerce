import 'package:e_commerce/features/home_screen/domain/use_cases/getCategoriesUseCase.dart';
import 'package:e_commerce/features/home_screen/domain/use_cases/getProductsUseCase.dart';
import 'package:e_commerce/features/home_screen/presentation/cubit/homeScreen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/shared_components.dart';
import '../../../categories_screen/presentation/pages/catalog_screen.dart';
import '../../domain/use_cases/getBrandsUseCase.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{

  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  GetProductsUseCase productsUseCase;

  @factoryMethod
  HomeScreenViewModel(this.categoriesUseCase , this.brandsUseCase , this.productsUseCase):super(HomeScreenInitial());

  List<dynamic> offers = [
    const AssetImage('assets/images/offer 1.png'),
    const AssetImage('assets/images/offer 2.png'),
    const AssetImage('assets/images/offer 3.png'),
  ];

  void initPage() async {
    emit(HomeScreenLoading());
    try {
      var categories = await categoriesUseCase.invoke();
      var brands = await brandsUseCase.invoke();
      var products = await productsUseCase.invoke();
      emit(HomeScreenSuccess(categories, brands , products));
    } catch (e) {
      emit(HomeScreenError(e.toString()));
    }
  }

  void onCategoryClicked(BuildContext context , String? categoryId , String? categoryName){
    navigateTo(context, CatalogScreen(categoryId: categoryId,categoryName: categoryName,));
  }
}