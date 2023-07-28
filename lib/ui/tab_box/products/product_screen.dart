import 'package:baraka_shop/app/app_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("product screen"),
      centerTitle: true,
    ),);
  }
}