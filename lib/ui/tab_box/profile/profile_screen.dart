import 'package:animate_do/animate_do.dart';
import 'package:baraka_shop/providers/auth_provider.dart';
import 'package:baraka_shop/utils/sizebox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import '../../widget/global_button.dart';
import '../../widget/global_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFC6828,
      appBar: AppBar(
        backgroundColor: AppColors.cFC6828,
        elevation: 0,
        title: Text("profile screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthProvider>().logOut(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                color: AppColors.c040415,
              ),),
            ],),
            Expanded(
            child: ListView(
              children: [
                70.ph,
                FadeInLeft(
                  child: GlobalTextField(
                      icon: AppIcons.username,
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: context.read<AuthProvider>().emailController),
                ),
                20.ph,
                FadeInRight(
                  child: GlobalTextField(
                    icon: AppIcons.password,
                    hintText: "Enter you password",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    controller: context.read<AuthProvider>().passwordController,
                  ),
                ),
                70.ph,
                FadeInUpBig(
                  child: GlobalButton(
                    title: "Update",
                    onTap: () {},
                  ),
                ),
                100.ph,
              ],
            ),
          ),
     ] ),
      ),
    );
  }
}
