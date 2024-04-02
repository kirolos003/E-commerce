import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/home_screen/presentation/cubit/homeScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../categories_screen/presentation/cubit/catalogViewModel.dart';
import '../../domain/models/Brand.dart';
import '../../domain/models/Category.dart';
import 'productItem.dart';

class CategoriesWidget extends StatelessWidget {
  final HomeScreenViewModel? viewModel;
  final List<Category>? categoriesList;
  final List<Brand>? brandsList;
  final List<Product>? productList;
  final CatalogScreenViewModel? catalogViewModel;


  const CategoriesWidget({
    Key? key,
     this.viewModel,
     this.categoriesList,
     this.brandsList,
     this.productList,
     this.catalogViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width.w - 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: const Color(0xff004182),
                          strokeAlign: BorderSide.strokeAlignInside,
                          width: 1.5
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          const ImageIcon(
                            AssetImage('assets/images/search.png'),
                            color: Color(0xff004182),
                          ),
                          SizedBox(width: 10.w),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "What do you search for ?",
                                hintStyle: TextStyle(
                                    color: Color(0x9906004f),
                                  fontWeight: FontWeight.w400
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                 SizedBox(width: 24.w),
                const ImageIcon(
                  AssetImage('assets/images/cart.png'),
                  color: Color(0xff004182),
                ),
              ],
            ),
             SizedBox(height: 16.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 200.h,
                width: 398.w,
                child: CarouselSlider(
                  items: viewModel?.offers
                      .map((e) => Image(
                    image: e,
                    fit: BoxFit.cover,
                  ))
                      .toList(),
                  options: CarouselOptions(
                    height: 200.h,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0,
                  ),
                ),
              ),
            ),
             SizedBox(height: 24.h),
            Row(
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xff004182),
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff004182),
                  size: 15,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 260.h,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      catalogViewModel?.onCategoryClicked(
                        context,
                        categoriesList?[index].id ?? "",
                        categoriesList?[index].name ?? "",
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: CachedNetworkImage(
                                imageUrl: categoriesList?[index].image ?? "",
                                placeholder: (context, url) =>
                                const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            categoriesList?[index].name ?? "",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                const Text(
                  'Brands',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xff004182),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff004182),
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 260,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CachedNetworkImage(
                              imageUrl: brandsList?[index].image ?? "",
                              placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          brandsList?[index].name?.split(" ").first ?? "",
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Text(
                  'Best Seller',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xff004182),
                        ),
                      ),
                    ),
                    const Icon(
                        Icons.arrow_forward_ios,
                      color: Color(0xff004182),
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height :250,
              child: ListView.builder(
                  itemBuilder: (context, index) => ProductItem(productList![index]),
                itemCount: productList?.length ?? 0,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}


