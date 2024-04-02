import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/wishListStates.dart';
import '../cubit/wishListViewModel.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  var viewModel = getIt.get<WishListViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.loadWishList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListViewModel, WishListStates>(
      bloc: viewModel,
      buildWhen: (previous, current) => !(current is WishListLoading || current is WishListError),
      listenWhen: (previous, current) => current is WishListLoading || current is WishListError,
      builder: (context, state) {
        if (state is WishListLoading) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/images/logo.png'),
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
              ),
            ),
          );
        }
        if (state is WishListSuccess) {
          return ConditionalBuilder(
            condition: state.wishList != null && state.wishList!.isNotEmpty,
            builder: (context) => ListView.builder(
              itemCount: state.wishList!.length,
              itemBuilder: (context, index) {
                return buildListProduct(state.wishList![index], context);
              },
            ),
            fallback: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/images/logo.png'),
                    width: 100.w,
                    height: 100.h,
                  ),
                  const Text('No items in your wish list'),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
      listener: (context, state) {
        if (state is WishListError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  viewModel.loadWishList();
                },
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildListProduct(Product product, context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1, // Border width
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: product.imageCover ?? '',
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff06004F),
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Text(
                  'EGP ${product.price ?? ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff06004F),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle decrease quantity button press
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle increase quantity button press
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // Handle delete button press
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
