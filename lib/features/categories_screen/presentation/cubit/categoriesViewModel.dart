import 'package:e_commerce/features/categories_screen/presentation/cubit/categories_states.dart';
import 'package:e_commerce/features/home_screen/domain/use_cases/getCategoriesUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class CategoriesScreenViewModel extends Cubit<CategoriesScreenStates> {
  GetCategoriesUseCase categoriesUseCase;

  @factoryMethod
  CategoriesScreenViewModel(this.categoriesUseCase) : super(CategoriesScreenInitial()){
    loadCategories();
  }

  void loadCategories() async{
    emit(CategoriesScreenLoading());
    try {
      var categories = await categoriesUseCase.invoke();
      emit(CategoriesScreenSuccess(categories));
    } catch (e) {
      emit(CategoriesScreenError(e.toString()));
    }
  }



}