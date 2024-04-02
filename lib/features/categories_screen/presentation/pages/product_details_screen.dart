import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product? product;

  ProductDetailsScreen({this.product, Key? key}) : super(key: key);

  @override
  ProductDetailsScreenState createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int? selectedSizeIndex;
  int? selectedColorIndex;
  int? selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff004182),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Product Details',
              style: TextStyle(
                color: Color(0xff06004F),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/search.png'),
              color: Color(0xff004182),
            ),
            onPressed: () {
              // navigateTo(context, const MainSearchScreen());
            },
          ),
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/cart.png'),
              color: Color(0xff004182),
            ),
            onPressed: () {
              // navigateTo(context, const MainSearchScreen());
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CarouselSlider(
                    items: widget.product!.images!
                        .map((e) => CachedNetworkImage(
                      imageUrl: e ,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => Image.asset('assets/image_not_found.png'),
                    ))
                        .toList(),
                    options: CarouselOptions(
                      height: 300.h,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.product!.title ?? '',
                      style: const TextStyle(
                        color: Color(0xff06004F),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'EGP ${widget.product!.price}' ?? '',
                      style: const TextStyle(
                        color: Color(0xff06004F),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2, // Limit to 2 lines
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1, // Set border width to 1
                      ),
                    ),
                    child: Text(
                      '${widget.product?.sold} Sold',
                      style: const TextStyle(
                        color: Color(0xff06004F),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '${widget.product?.ratingsAverage} (${widget.product?.ratingsQuantity})',
                        style: const TextStyle(
                          color: Color(0xff06004F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        width: 130.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff004182),
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (selectedQuantity! > 1) {
                                    selectedQuantity = selectedQuantity! - 1;
                                  }

                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              selectedQuantity.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedQuantity = selectedQuantity! + 1;
                                });
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Description',
                style: TextStyle(
                  color: const Color(0xff06004F),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.product!.description ?? '',
                style: TextStyle(
                  color: const Color(0x9906004f),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Size',
                style: TextStyle(
                  color: const Color(0xff06004F),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                          (index) => buildSizeIcon(index),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Colors',
                style: TextStyle(
                  color: const Color(0xff06004F),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                          (index) => buildColorIcon(index),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          color: const Color(0xff06004F),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'EGP ${widget.product!.price} ',
                        style: TextStyle(
                          color: const Color(0xff06004F),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width : 24.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff004182),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSizeIcon(int index) => Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: GestureDetector(
      onTap: () {
        setState(() {
          selectedSizeIndex = index;
        });
      },
      child: Container(
        width: 42.w,
        height: 42.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedSizeIndex == index
              ? const Color(0xff004182)
              : Colors.white,
        ),
        child: Center(
          child: Text(
            '${[38, 39, 40, 41, 42][index]}',
            style: TextStyle(
              color: selectedSizeIndex == index
                  ? Colors.white
                  : const Color(0xff06004F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ),
  );

  Widget buildColorIcon(int index) => Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: GestureDetector(
      onTap: () {
        setState(() {
          selectedColorIndex = index;
        });
      },
      child: Container(
        width: 42.w,
        height: 42.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: [Colors.black, Colors.red, Colors.blue, Colors.green, Colors.yellow][index],
        ),
        child: selectedColorIndex == index
            ? const Center(
                 child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        )
            : null,
      ),
    ),
  );
}
