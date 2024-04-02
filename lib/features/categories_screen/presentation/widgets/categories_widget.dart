import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/categories_screen/presentation/cubit/catalogViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home_screen/domain/models/Category.dart';
import '../cubit/categoriesViewModel.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoriesScreenViewModel? viewModel;
  final List<Category>? categoriesList;
  final CatalogScreenViewModel? catalogViewModel;

  const CategoriesWidget({super.key, this.viewModel , this.categoriesList , this.catalogViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Categories' , style: TextStyle(
            color: const Color(0xff326396),
            fontSize : 30.sp,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 16.h,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                scrollDirection: Axis.vertical,
                itemCount: categoriesList?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                        catalogViewModel?.onCategoryClicked(context , categoriesList?[index].id , categoriesList?[index].name);
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
                }
            ),
          ),
        ],
      ),
    );
  }

}
