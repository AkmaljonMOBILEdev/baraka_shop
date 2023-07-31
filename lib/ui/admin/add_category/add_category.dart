import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../data/models/category/category_model.dart';
import '../../../providers/category_provider.dart';
import '../../widget/global_text_field.dart';
import '../../widget/pick_image.dart';

class CategoryADD extends StatefulWidget {
  const CategoryADD({super.key});

  @override
  State<CategoryADD> createState() => _CategoryADDState();
}

class _CategoryADDState extends State<CategoryADD> {
  XFile? _imageFile;
  String? _imageUrl;

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
        title: const Text("Category Add"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            GlobalTextField(
              hintText: "Add Category name",
              controller:
                  context.read<CategoryProvider>().categoryNamecontroller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              icon: '',
            ),
            SizedBox(
              height: 10.h,
            ),
            GlobalTextField(
                hintText: "Add Category description",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                icon: '',
                controller:
                    context.read<CategoryProvider>().categoryDesccontroller),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                print(_imageUrl);
                if (context
                        .read<CategoryProvider>()
                        .categoryNamecontroller
                        .text
                        .isNotEmpty &&
                    context
                        .read<CategoryProvider>()
                        .categoryDesccontroller
                        .text
                        .isNotEmpty &&
                    _imageUrl != null) {
                  context.read<CategoryProvider>().addCategory(
                        context: context,
                        categoryModel: CategoryModel(
                          categoryId: '',
                          categoryName: context
                              .read<CategoryProvider>()
                              .categoryNamecontroller
                              .text,
                          description: context
                              .read<CategoryProvider>()
                              .categoryDesccontroller
                              .text,
                          imageUrl: _imageUrl!,
                          createdAt: DateTime.now().toString(),
                        ),
                      );
                }
              },
              child: const Text(
                "Add Category",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
