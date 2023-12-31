import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../data/firebase/category_service.dart';
import '../data/models/category/category_model.dart';
import '../data/models/product/product_model.dart';
import '../data/models/universal_data.dart';
import '../utils/ui_utils/loading_dialog.dart';


class CategoryProvider with ChangeNotifier {
  CategoryProvider({required this.categoryService});

  final CategoryService categoryService;

  TextEditingController categoryNamecontroller = TextEditingController();
  TextEditingController categoryDesccontroller = TextEditingController();

  Future<void> addCategory({
    required BuildContext context,
    required CategoryModel categoryModel,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await categoryService.addCategory(categoryModel: categoryModel);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> updateCategory({
    required BuildContext context,
    required CategoryModel categoryModel,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await categoryService.updateCategory(categoryModel: categoryModel);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> deleteCategory({
    required BuildContext context,
    required String categoryId,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await categoryService.deleteCategory(categoryId: categoryId);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }



  Stream<List<CategoryModel>> getCategories() =>
      FirebaseFirestore.instance.collection("categories").snapshots().map(
            (event1) => event1.docs
                .map((doc) => CategoryModel.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<ProductModel>> getAllProducts() =>
      FirebaseFirestore.instance.collection("products").snapshots().map(
            (event1) => event1.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList(),
      );
  // Stream<QuerySnapshot<Map<String,dynamic>>> getAllProductName() =>
  //     FirebaseFirestore.instance.collection("products").orderBy("productName").get(
  //           (event1) => event1.docs
  //           .map((doc) => ProductModel.fromJson(doc.data()))
  //           .toList(),
  //     );


  Stream<List<ProductModel>> getProductsByCategoryIdStream(String categoryId) {
    final databaseReference = FirebaseFirestore.instance.collection('products');

    return databaseReference
        .where('categoryId', isEqualTo: categoryId)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList());
  }




  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    notifyListeners();
  }
}
