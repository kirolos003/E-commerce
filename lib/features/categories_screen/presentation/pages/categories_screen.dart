import 'package:e_commerce/features/categories_screen/presentation/cubit/categories_states.dart';
import 'package:e_commerce/features/categories_screen/presentation/widgets/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../di/di.dart';
import '../cubit/catalogViewModel.dart';
import '../cubit/categoriesViewModel.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();


}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesScreenViewModel viewModel = getIt.get<CategoriesScreenViewModel>();
  CatalogScreenViewModel catalogViewModel = getIt.get<CatalogScreenViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesScreenViewModel, CategoriesScreenStates>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is CategoriesScreenLoading) return false;
        if (current is CategoriesScreenError) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is CategoriesScreenLoading) return true;
        if (current is CategoriesScreenError) return true;
        return false;
      },
      builder: (context, state) {
        if (state is CategoriesScreenSuccess) {
          return CategoriesWidget(
            categoriesList: state.categoriesList,
            viewModel: viewModel,
            catalogViewModel: catalogViewModel,
          );
        }
        if (state is CategoriesScreenLoading) {
          return  Scaffold(
            body : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image : const AssetImage('assets/images/logo.png'),
                      width: 100.w,
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        SizedBox(width: 10.w),
                        const Text('Loading...'),
                      ],
                    ),
                  ],
                ))
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is CategoriesScreenError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  viewModel.loadCategories();
                },
              ),
            ),
          );
        }
      },
    );
  }
}
