import 'package:baraka_shop/ui/tab_box/products/widget/ShimmerProductScreen.dart';
import 'package:baraka_shop/ui/tab_box/products/widget/add_product.dart';
import 'package:baraka_shop/ui/tab_box/products/widget/category_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../data/models/product/product_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/category_provider.dart';
import '../../../utils/colors.dart';
import '../../widget/shimmer_profile_image.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: context.read<AuthProvider>().isadminvisible,
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Addproducts(),
                ));
          },
          child: const Text(
            "Add Products",
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(children: [
        const CategoryNameInHome(),
        Expanded(
          child: StreamBuilder(
              stream: context.read<CategoryProvider>().getAllProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const ShimmerProductScreen();
                } else if (snapshot.hasData) {
                  return snapshot.data!.isNotEmpty
                      ? Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                        const  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.50,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, int index) {
                          ProductModel productModel =
                          snapshot.data![index];
                          return Container(

                            padding: EdgeInsets.all(5.h),
                            margin:  EdgeInsets.all(5.h),


                            decoration: BoxDecoration(
                              color: AppColors.cFC6828, //Colors.yellow,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ...List.generate(
                                      productModel.productImages.length,
                                          (index) => Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          child: SizedBox(
                                            width: 150.w,
                                            height: 230.h,
                                            child: CachedNetworkImage(
                                                imageUrl: productModel
                                                    .productImages[index],
                                                placeholder: (context,
                                                    url) =>
                                                const ShimmerPhoto(),
                                                errorWidget: (context,
                                                    url, error) =>
                                                const Icon(
                                                    Icons.error,
                                                    color:
                                                    Colors.red),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  productModel.productName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${(productModel.price).toString()} ||  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Container(
                                        height: 20.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: AppColors.cFC6828),
                                        child: Center(
                                            child: Text(
                                              productModel.currency.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            )))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${(productModel.createdAt.toString()).substring(0, 16)} ||  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Container(
                                        height: 20.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: AppColors.c040415),
                                        child: Center(
                                            child: Text(
                                              productModel.count.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            )))
                                  ],
                                ),
                                // SavatButton(productModel: productModel)
                              ],
                            ),
                          );
                        }),
                  )
                      : const ShimmerProductScreen();
                }
                return const ShimmerProductScreen();
              }),
        ),
      ]),
    );
  }
}
