import 'package:baraka_shop/providers/auth_provider.dart';
import 'package:baraka_shop/ui/tab_box/profile/widget/edit_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../providers/profiles_provider.dart';
import '../../../utils/colors.dart';
import '../../widget/shimmer_profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;

    return Scaffold(
      backgroundColor: AppColors.cFC6828,
      appBar: AppBar(
        backgroundColor: AppColors.cFC6828,
        elevation: 0,
        title: const Text("Profile screen"),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthProvider>().logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [

            SizedBox(
              height: 20.h,
            ),
            user!.photoURL == null
                ? Icon(
              Icons.account_circle,
              size: 96.h,
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 160.h,
                width: 150.w,
                child: CachedNetworkImage(
                    imageUrl: user.photoURL ?? '',
                    placeholder: (context, url) => const ShimmerPhoto(),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
                    width: 140.w,
                    fit: BoxFit.cover),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                user.displayName ?? '',
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Center(
              child: Text(
                user.email ?? '',
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
              },
              title: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.black),
              ),
              trailing: const Icon(Icons.edit),
            ),
            Container(
              decoration: BoxDecoration(   color: Colors.teal.withOpacity(0.2),borderRadius: BorderRadius.circular(10)),

              child: ListTile(
                onTap: () {
                  context.read<AuthProvider>().logOut(context);
                },
                title: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),

            Stack(children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(
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
                trailing: const Icon(
                  Icons.exit_to_app_outlined,
                  color: Colors.white,
                ),
              ),
            ),

     ] ),
      ),
    );
  }
}
