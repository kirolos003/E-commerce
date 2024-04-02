import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../di/di.dart';
import '../cubit/catalogViewModel.dart';
import '../cubit/catalogViewModelStates.dart';
import '../widgets/catalog_widget.dart';

class CatalogScreen extends StatefulWidget {
  String? categoryId;
  String? categoryName;

   CatalogScreen({this.categoryId ,this.categoryName, Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {

  CatalogScreenViewModel viewModel = getIt.get<CatalogScreenViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.loadCatalogProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatalogScreenViewModel, CatalogScreenStates>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is CatalogScreenLoading) return false;
        if (current is CatalogScreenError) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is CatalogScreenLoading) return true;
        if (current is CatalogScreenError) return true;
        return false;
      },
      builder: (context, state) {
        if (state is CatalogScreenSuccess) {
          return CatalogWidget(
            state.catalogProductsList,
            viewModel: viewModel,
            categoryName: widget.categoryName,
          );
        }
        if (state is CatalogScreenLoading) {
          return Scaffold(
            body :  Center(
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
                )),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is CatalogScreenError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  viewModel.loadCatalogProducts();
                },
              ),
            ),
          );
        }
      },
    );
  }
}
