import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../providers/products_provider.dart';
import '../../../widget/global_text_field.dart';
import '../../../widget/pick_image.dart';
import '../../category/category_details/category_selection.dart';
import 'add_product_button.dart';

class Addproducts extends StatefulWidget {
  const Addproducts({super.key});

  @override
  State<Addproducts> createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  XFile? _imageFile;
  String? _imageUrl;
  String? catID;

  Future<void> _pickImage() async {
    XFile? pickedFile = await pickImage();
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _uploadImage() async {
    String? downloadUrl = await uploadImageToFirebase(_imageFile);
    setState(() {
      _imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            GlobalTextField(
                hintText: "Add Product name",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                icon: '',
                controller:
                    context.read<ProductsProvider>().ProductsNamecontroller),
            SizedBox(height: 10.h),
            GlobalTextField(
                hintText: "Add Product count",
                textInputAction: TextInputAction.next,
                icon: '',
                keyboardType: TextInputType.number,
                controller:
                    context.read<ProductsProvider>().ProductsCountcontroller),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
                hintText: "Add Product description",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                icon: '',
                controller:
                    context.read<ProductsProvider>().ProductsDesccontroller),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                icon: '',
                hintText: "Add Product Price",

                controller:
                    context.read<ProductsProvider>().ProductsPricecontroller),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
              hintText: "Add Product Currency",
              controller:
                  context.read<ProductsProvider>().ProductsCurrencycontroller,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              icon: '',
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CategorySelectionWidget(
                          onCategorySelected: (p0) {
                            setState(() {
                              catID = p0;
                            });
                          },
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Choose Category",
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () async {
                    await _pickImage();

                    await _uploadImage();
                  },
                  child: const Text('Upload Image'),
                ),
                const SizedBox(width: 20),
                if (_imageFile != null)
                  Image.file(
                    File(
                      _imageFile!.path,
                    ),
                    height: 70,
                  ),
              ],
            ),
            AddProductButton(
              imageUrl: _imageUrl,
              catId: catID,
            ),
          ],
        ),
      ),
    );
  }
}
