import 'package:baraka_shop/app/app_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("favorite screen"),
      centerTitle: true,
    ),);
  }
}