import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../provider/app_provider.dart';
import '../../../../shared/shared_components.dart';
import '../../../home_screen/presentation/widgets/productItem.dart';
import '../cubit/catalogViewModel.dart';
import '../pages/product_details_screen.dart';


class CatalogWidget extends StatelessWidget {
  final CatalogScreenViewModel? viewModel;
  List<Product> catalogProductsList;
  String? categoryName;



  CatalogWidget(this.catalogProductsList,{super.key, this.viewModel , this.categoryName});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/Group 5.png'),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Text('$categoryName' , style: TextStyle(
              color: const Color(0xff326396),
              fontSize : 30.sp,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 16,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: catalogProductsList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigateTo(context, ProductDetailsScreen(
                          product: catalogProductsList[index],
                        ));
                      },
                      child: ProductItem(
                        catalogProductsList[index],
                      )
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

}
