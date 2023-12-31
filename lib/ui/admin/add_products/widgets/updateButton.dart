
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/product/product_model.dart';
import '../../../../providers/products_provider.dart';

class UpdateProductButton extends StatefulWidget {
  UpdateProductButton({super.key, required this.imageUrl, required this.catID, required this.productModel});

  final String? imageUrl;
  final String? catID;
  ProductModel productModel;

  @override
  State<UpdateProductButton> createState() => _UpdateProductButtonState();
}

class _UpdateProductButtonState extends State<UpdateProductButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.black),
      ),
      onPressed: () {
        if (context
                .read<ProductsProvider>()
                .ProductsNamecontroller
                .text
                .isNotEmpty &&
            context
                .read<ProductsProvider>()
                .ProductsDesccontroller
                .text
                .isNotEmpty &&
            context
                .read<ProductsProvider>()
                .ProductsCountcontroller
                .text
                .isNotEmpty &&
            context
                .read<ProductsProvider>()
                .ProductsCurrencycontroller
                .text
                .isNotEmpty &&
            context
                .read<ProductsProvider>()
                .ProductsPricecontroller
                .text
                .isNotEmpty &&
            widget.imageUrl != null) {
          context.read<ProductsProvider>().updateProducts(
                context: context,
                productModel: ProductModel(
                    count: int.parse(context
                        .read<ProductsProvider>()
                        .ProductsCountcontroller
                        .text),
                    price: int.parse(context
                        .read<ProductsProvider>()
                        .ProductsPricecontroller
                        .text),
                    productImages: [widget.imageUrl],
                    categoryId: widget.catID!,
                    productId: widget.productModel.productId,
                    productName: context
                        .read<ProductsProvider>()
                        .ProductsNamecontroller
                        .text,
                    description: context
                        .read<ProductsProvider>()
                        .ProductsDesccontroller
                        .text,
                    createdAt: widget.productModel.createdAt,
                    currency: context
                        .read<ProductsProvider>()
                        .ProductsCurrencycontroller
                        .text),
              );
        }
      },
      child: const Text(
        "Update Product",
      ),
    );
  }
}
