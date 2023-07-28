import 'package:baraka_shop/app/app_screen.dart';
import 'package:baraka_shop/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("profile screen"),
      centerTitle: true,
      actions: [IconButton(onPressed: (){
        context.read<AuthProvider>().logOut(context);
      }, icon: Icon(Icons.logout))],
    ),);
  }
}