import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/categories_screen/presentation/pages/product_details_screen.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/shared/shared_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> words = product.title!.split(' ');

    String? displayText = words.length > 1 ? '${words[0]} ${words[1]}' : product.title;

    return InkWell(
      onTap: () {
        navigateTo(context, ProductDetailsScreen(product: product));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 122.h,
            width: 158.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children:[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: product.images != null && product.images!.length > 1 ? product.images![1] : '', // Add a null check here
                          height: 200.h,
                          width: double.infinity,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          right: 5.w,
                          child: IconButton(onPressed: (){},
                              icon : InkWell(
                                onTap: () {
                                    //viewModel?.onWishListClicked(context , product.id);
                                  },
                              child: Container(
                                width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                  child: ImageIcon(const AssetImage('assets/icons/wish.png') , size: 30.sp,))))),
                    ] ,
                  ),
                ),
                const SizedBox(height: 8), // Adjust spacing for web
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    displayText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xff06004F),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Review (${product.ratingsAverage})',
                              style: const TextStyle(
                                color: Color(0xff06004F),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.star,
                              color: Color(0xffF4B400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'EGP',
                              style: TextStyle(
                                color: const Color(0xff06004F),
                                fontSize: 9.sp, // Adjust font size for web
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${product.price}',
                              style: TextStyle(
                                color: const Color(0xff06004F),
                                fontSize: 14.sp, // Adjust font size for web
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: (){},
                              child: Image(
                                width: 30.w,
                                height: 30.h,
                                image: const AssetImage('assets/images/add_button.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
