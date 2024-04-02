import 'package:e_commerce/features/categories_screen/presentation/cubit/catalogViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../di/di.dart';
import '../cubit/homeScreenViewModel.dart';
import '../cubit/homeScreen_states.dart';
import '../widgets/categories_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = getIt.get<HomeScreenViewModel>();
  CatalogScreenViewModel catalogViewModel = getIt.get<CatalogScreenViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is HomeScreenLoading) return false;
        if (current is HomeScreenError) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is HomeScreenLoading) return true;
        if (current is HomeScreenError) return true;
        return false;
      },
      builder: (context, state) {
        if (state is HomeScreenSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CategoriesWidget(
              catalogViewModel: catalogViewModel,
              brandsList: state.brandsList,
              categoriesList: state.categoriesList,
              productList: state.productsList,
              viewModel: viewModel,
            ),
          );
        }
        if (state is HomeScreenLoading) {
          return  Center(
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
              ));
        }
        return Container();
      },
      listener: (context, state) {
        if (state is HomeScreenError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Something went wrong!')));
        }
      },
    );
  }
}



